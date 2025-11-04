package org.example.mvc.model.repository;

import org.example.mvc.model.entity.Pet;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;

public class InMemoryPetRepository implements PetRepository {
    private final List<Pet> petList = new ArrayList<>();
    private final AtomicInteger idCounter = new AtomicInteger(1);

    public InMemoryPetRepository() {
        save(new Pet("누렁이", 5, "강아지"));
        save(new Pet("야옹이", 2, "고양이"));
        save(new Pet("짹짹이", 1, "새"));
        save(new Pet("개북이", 10, "거북이"));
        save(new Pet("금붕어", 1, "물고기"));
        save(new Pet("햄스터", 2, "햄스터"));
    }

    @Override
    public List<Pet> findAll() {
        return new ArrayList<>(petList);
    }

    @Override
    public void save(Pet pet) {
        if (pet.id() == null) {
            pet = new Pet(idCounter.getAndIncrement(), pet.name(), pet.age(), pet.category());
        }
        petList.add(pet);
    }

    @Override
    public void update(Pet pet) {
        petList.stream()
                .filter(p -> Objects.equals(p.id(), pet.id()))
                .findFirst()
                .ifPresent(p -> {
                    petList.remove(p);
                    petList.add(pet);
                });
    }

    @Override
    public void delete(int id) {
        petList.removeIf(p -> Objects.equals(p.id(), id));
    }
}
