package org.example.mvc.model.entity;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record Pet(Integer id, String name, int age, String category) {
    public Pet(String name, int age, String category) {
        this(null, name, age, category);
    }
}
