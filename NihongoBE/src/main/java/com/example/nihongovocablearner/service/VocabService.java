package com.example.nihongovocablearner.service;

import com.example.nihongovocablearner.entity.Vocab;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

public interface VocabService extends CommonService<Vocab> {
    QuizQuestion getRandomVocabWithOptions();
    boolean handleAnswer(Long vocabId, int selectedIndex);
    boolean hasMoreVocabs();
    void initializeVocabsForLesson(Long lessonId);


    @Getter
    @AllArgsConstructor
    class QuizQuestion {
        private Long vocabId;
        private String word;
        private List<String> options;
        private int correctIndex;
    }
    public int getRemainingCount();
}

