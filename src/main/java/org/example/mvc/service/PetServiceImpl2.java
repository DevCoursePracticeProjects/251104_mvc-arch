package org.example.mvc.service;

import org.example.mvc.model.entity.Pet;
import org.example.mvc.model.repository.PetRepository;
import org.example.mvc.model.repository.SupabasePetRepository;

import java.util.List;

// 방법2
public class PetServiceImpl2 implements PetService {
    private final PetRepository repository = new SupabasePetRepository(); // 방법 1

    @Override
    public List<Pet> readAll() {
        // 변경 로직...
        return repository.findAll(); // Controller는 최종적인 결과만.
    }

    @Override
    public void create(String name, int age, String category) {
        Pet pet = new Pet(name, age, category);
        repository.save(pet);
    }

    @Override
    public void update(Pet pet) {
        repository.update(pet);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }
}
