package com.example.nihongovocablearner.service;
import com.example.nihongovocablearner.entity.Kanji;
import java.util.List;

public interface KanjiService {
        Kanji save(Kanji kanji);
        List<Kanji> findByLessonId(Long lessonId);
        void delete(Long id);
    }
