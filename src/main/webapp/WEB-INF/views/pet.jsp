<%--
    Repository나 POST 관련된 처리 등을 Controller로 로직을 옮기고,
    View(UI) jsp는 레이아웃이나 디자인 자체에 집중 -> MVC2
--%>
<%@ page import="org.example.mvc.model.entity.Pet" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>반려동물을 소개합니다</title>
    <style>
        .pet-card {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            width: 200px;
        }
        .button-container {
            display: flex;
            gap: 5px; /* 버튼 사이의 간격 */
            margin-top: 10px;
        }
    </style>
</head>
<body>

<form method="post">
    <h3>새로운 반려동물</h3>
    이름 : <input type="text" name="name" required><br>
    나이 : <input type="number" name="age" required><br>
    종류 : <input type="text" name="category" required><br>
    <button type="submit">등록</button>
</form>

<hr>

<h3>등록된 반려동물</h3>
<div style="display: flex; flex-wrap: wrap; gap: 16px">
    <% for (Pet pet : (List<Pet>) request.getAttribute("petList")) { %>
    <div class="pet-card">
        <form method="post" action="<%= request.getContextPath() %>/pet">
            <input type="hidden" name="id" value="<%= pet.id() %>">
            <p>ID: <%= pet.id() %></p>
            이름 : <input type="text" name="name" value="<%= pet.name() %>" required><br>
            나이 : <input type="number" name="age" value="<%= pet.age() %>" required><br>
            종류 : <input type="text" name="category" value="<%= pet.category() %>" required><br>
            <div class="button-container">
                <button type="submit" name="_method" value="put">수정</button>
                <button type="submit" name="_method" value="delete" onclick="return confirm('삭제할까요?');">삭제</button>
            </div>
        </form>
    </div>
    <% } %>
</div>
</body>
</html>
