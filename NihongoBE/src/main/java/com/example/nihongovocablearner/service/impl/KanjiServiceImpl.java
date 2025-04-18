package com.example.nihongovocablearner.service.impl;

import com.example.nihongovocablearner.entity.Kanji;
import com.example.nihongovocablearner.repository.KanjiRepository;
import com.example.nihongovocablearner.service.KanjiService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KanjiServiceImpl implements KanjiService {

    private final KanjiRepository kanjiRepository;

    public KanjiServiceImpl(KanjiRepository kanjiRepository) {
        this.kanjiRepository = kanjiRepository;
    }

    @Override
    public Kanji save(Kanji kanji) {
        return kanjiRepository.save(kanji);
    }

    @Override
    public List<Kanji> findByLessonId(Long lessonId) {
        return kanjiRepository.findByLessonId(lessonId);
    }

    @Override
    public void delete(Long id) {
        kanjiRepository.deleteById(id);
    }
}