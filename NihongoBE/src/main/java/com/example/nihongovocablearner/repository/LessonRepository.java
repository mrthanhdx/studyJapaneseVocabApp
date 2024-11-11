package com.example.nihongovocablearner.repository;

import com.example.nihongovocablearner.entity.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonRepository extends JpaRepository<Lesson,Long> {
}
