package org.example.mvc.service;

import org.example.mvc.model.entity.Pet;

import java.util.List;

public interface PetService {
    List<Pet> readAll();
    void create(String name, int age, String category);
    void update(Pet pet); // 추가
    void delete(int id); // 추가
}
