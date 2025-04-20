package com.example.nihongovocablearner.controller;

import com.example.nihongovocablearner.entity.Kanji;
import com.example.nihongovocablearner.service.KanjiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/kanji-quiz")
public class KanjiQuizController {

    @Autowired
    private KanjiService kanjiService;

    @PostMapping("/start/{lessonId}")
    public ResponseEntity<?> startQuiz(@PathVariable Long lessonId) {
        try {
            kanjiService.initializeKanjisForLesson(lessonId);
            return ResponseEntity.ok().body(Map.of(
                    "message", "Kanji quiz started for lesson " + lessonId,
                    "remaining", kanjiService.getRemainingCount()
            ));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", e.getMessage()
            ));
        }
    }

    @GetMapping("/next-question")
    public ResponseEntity<?> getNextQuestion() {
        try {
            KanjiService.QuizQuestion question = kanjiService.getRandomKanjiWithOptions();

            if (question == null) {
                return ResponseEntity.ok().body(Map.of(
                        "completed", true,
                        "message", "No more questions"
                ));
            }

            int remaining = kanjiService.getRemainingCount();

            Map<String, Object> response = new HashMap<>();
            response.put("kanjiId", question.getKanjiId());
            response.put("character", question.getCharacter()); // chữ Kanji
            response.put("options", question.getOptions());   // danh sách hiragana
            response.put("correctIndex", question.getCorrectIndex());
            response.put("remaining", remaining);
            response.put("completed", false);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", e.getMessage()
            ));
        }
    }

    @PostMapping("/submit-answer")
    public ResponseEntity<?> submitAnswer(@RequestBody Map<String, Object> payload) {
        try {
            Object kanjiIdObj = payload.get("kanjiId");
            Object selectedIndexObj = payload.get("selectedIndex");

            if (!(kanjiIdObj instanceof Number) || !(selectedIndexObj instanceof Number)) {
                return ResponseEntity.badRequest().body(Map.of(
                        "error", "Dữ liệu đầu vào không hợp lệ"
                ));
            }

            Long kanjiId = ((Number) kanjiIdObj).longValue();
            int selectedIndex = ((Number) selectedIndexObj).intValue();

            boolean isCorrect = kanjiService.handleAnswer(kanjiId, selectedIndex);

            Map<String, Object> response = new HashMap<>();
            response.put("correct", isCorrect);
            response.put("remaining", kanjiService.getRemainingCount());

            if (isCorrect) {
                Kanji kanji = kanjiService.findById(kanjiId);
                if (kanji != null) {
                    response.put("meaning", kanji.getMeaning());
                }
            }

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", e.getMessage()
            ));
        }
    }

    @GetMapping("/has-more")
    public ResponseEntity<Boolean> hasMoreQuestions() {
        return ResponseEntity.ok(kanjiService.hasMoreKanjis());
    }

    @GetMapping("/remaining")
    public ResponseEntity<Integer> getRemainingQuestions() {
        return ResponseEntity.ok(kanjiService.getRemainingCount());
    }
}
