package com.example.nihongovocablearner.repository;

import com.example.nihongovocablearner.entity.Kanji;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KanjiRepository extends JpaRepository<Kanji, Long> {
    List<Kanji> findByLessonId(Long lessonId);
}