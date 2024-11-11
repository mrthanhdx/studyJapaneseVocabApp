package com.example.nihongovocablearner.service.impl;

import com.example.nihongovocablearner.entity.Lesson;
import com.example.nihongovocablearner.repository.LessonRepository;
import com.example.nihongovocablearner.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LessonServiceImpl implements LessonService {

    @Autowired
    LessonRepository lessonRepository;

    @Override
    public void save(Lesson lesson) {
        lessonRepository.save(lesson);
    }

    @Override
    public void deleteById(Long id) {
        lessonRepository.deleteById(id);
    }

    @Override
    public Lesson findById(Long id) {
        return lessonRepository.findById(id).orElse(null);
    }

    @Override
    public List<Lesson> findAll() {
        return lessonRepository.findAll();
    }
}
