package org.example.mvc.model.repository;

import org.example.mvc.model.entity.Pet;

import java.util.List;

public interface PetRepository {
    List<Pet> findAll();
    void save(Pet pet);
    void update(Pet pet); // 추가
    void delete(int id); // 추가
}
