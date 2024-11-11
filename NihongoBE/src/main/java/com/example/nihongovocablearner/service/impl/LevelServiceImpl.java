package com.example.nihongovocablearner.service.impl;

import com.example.nihongovocablearner.entity.Level;
import com.example.nihongovocablearner.repository.LevelRepository;
import com.example.nihongovocablearner.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LevelServiceImpl implements LevelService {

    @Autowired
    LevelRepository levelRepository;
    @Override
    public void save(Level level) {
        levelRepository.save(level);
    }

    @Override
    public void deleteById(Long id) {
        levelRepository.deleteById(id);
    }

    @Override
    public Level findById(Long id) {
        return levelRepository.findById(id).orElse(null);
    }

    @Override
    public List<Level> findAll() {
        return levelRepository.findAll();
    }
}
