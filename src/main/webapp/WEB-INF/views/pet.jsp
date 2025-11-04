<%@ page import="org.example.mvc.model.entity.Pet" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>반려동물을 소개합니다</title>
    <style>
        body {
            background-color: #F0F0F0;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 960px;
            margin: 0 auto;
        }
        h1, h3 {
            color: #96A78D;
            text-align: center;
        }
        .form-container, .pet-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="number"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .button-container {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        button {
            flex-grow: 1;
            padding: 10px;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        button[value="put"] {
            background-color: #B6CEB4; /* 초록색 */
        }
        button[value="put"]:hover {
            background-color: #91a28f;
        }
        button[value="delete"] {
            background-color: #D9E9CF; /* 빨간색 */
        }
        button[value="delete"]:hover {
            background-color: #a2af9c;
        }
        .submit-button {
             background-color: #96A78D; /* 파란색 */
        }
        .submit-button:hover {
            background-color: #636e5e;
        }
        .pet-list-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>반려동물을 소개합니다</h1>

    <div class="form-container">
        <h3>새로운 반려동물</h3>
        <form method="post">
            이름 : <input type="text" name="name" required><br>
            나이 : <input type="number" name="age" required><br>
            종류 : <input type="text" name="category" required><br>
            <button type="submit" class="submit-button">등록</button>
        </form>
    </div>

    <hr>

    <h3>등록된 반려동물</h3>
    <div class="pet-list-container">
        <% for (Pet pet : (List<Pet>) request.getAttribute("petList")) { %>
        <div class="pet-card">
            <form method="post" action="<%= request.getContextPath() %>/pet">
                <input type="hidden" name="id" value="<%= pet.id() %>">
                <p><strong>ID:</strong> <%= pet.id() %></p>
                이름 : <input type="text" name="name" value="<%= pet.name() %>" required><br>
                나이 : <input type="number" name="age" value="<%= pet.age() %>" required><br>
                종류 : <input type="text" name="category" value="<%= pet.category() %>" required><br>
                <div class="button-container">
                    <button type="submit" name="_method" value="put">수정</button>
                    <button type="submit" name="_method" value="delete" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</button>
                </div>
            </form>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
