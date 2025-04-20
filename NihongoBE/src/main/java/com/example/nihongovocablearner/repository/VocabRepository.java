package com.example.nihongovocablearner.repository;

import com.example.nihongovocablearner.entity.Vocab;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VocabRepository extends JpaRepository<Vocab,Long> {
    List<Vocab> findByLessonId(Long lessonId);  // Add this method
}
