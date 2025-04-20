package com.example.nihongovocablearner.service;

import com.example.nihongovocablearner.entity.Kanji;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

public interface KanjiService extends CommonService<Kanji> {
    QuizQuestion getRandomKanjiWithOptions(); // giống như vocab
    boolean handleAnswer(Long kanjiId, int selectedIndex);
    boolean hasMoreKanjis();
    void initializeKanjisForLesson(Long lessonId);
    int getRemainingCount();
    List<Kanji> findByLessonId(Long id);
    void delete(Long id);

    @Getter
    @AllArgsConstructor
    class QuizQuestion {
        private Long kanjiId;
        private String character;           // Kanji character (例: 学)
        private List<String> options;       // Các đáp án (hiragana hoặc meaning tuỳ kiểu quiz)
        private int correctIndex;           // Vị trí đáp án đúng
    }
}
