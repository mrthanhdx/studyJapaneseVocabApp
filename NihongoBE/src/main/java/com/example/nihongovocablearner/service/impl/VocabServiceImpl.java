package com.example.nihongovocablearner.service.impl;

import com.example.nihongovocablearner.entity.Vocab;
import com.example.nihongovocablearner.repository.VocabRepository;
import com.example.nihongovocablearner.service.VocabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VocabServiceImpl implements VocabService {

    @Autowired
    VocabRepository vocabRepository;
    @Override
    public void save(Vocab vocab) {
        vocabRepository.save(vocab);
    }

    @Override
    public void deleteById(Long id) {
        vocabRepository.deleteById(id);
    }

    @Override
    public Vocab findById(Long id) {
        return vocabRepository.findById(id).orElse(null);
    }

    @Override
    public List<Vocab> findAll() {
        return vocabRepository.findAll();
    }
}
