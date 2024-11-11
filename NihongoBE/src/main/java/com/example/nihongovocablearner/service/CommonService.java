package com.example.nihongovocablearner.service;

import java.util.List;

public interface CommonService<T>{
    void save(T t);

    void deleteById(Long id);

    T findById(Long id);

    List<T> findAll();
}