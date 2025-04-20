package com.example.nihongovocablearner.controller;

import com.example.nihongovocablearner.service.VocabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/vocab-quiz")
public class VocabQuizController {

    @Autowired
    private VocabService vocabService;

    @PostMapping("/start/{lessonId}")
    public ResponseEntity<?> startQuiz(@PathVariable Long lessonId) {
        try {
            vocabService.initializeVocabsForLesson(lessonId);
            return ResponseEntity.ok().body(Map.of(
                    "message", "Quiz started for lesson " + lessonId,
                    "remaining", vocabService.getRemainingCount()
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
            VocabService.QuizQuestion question = vocabService.getRandomVocabWithOptions();

            // Kiểm tra nếu không còn câu hỏi nào
            if (question == null) {
                return ResponseEntity.ok().body(Map.of(
                        "completed", true,
                        "message", "No more questions"
                ));
            }

            // Lấy số câu hỏi còn lại (remaining)
            int remaining = vocabService.getRemainingCount();

            // Trả về câu hỏi cùng với thông tin về số câu hỏi còn lại
            Map<String, Object> response = new HashMap<>();
            response.put("vocabId", question.getVocabId());
            response.put("word", question.getWord());
            response.put("options", question.getOptions());
            response.put("correctIndex", question.getCorrectIndex());
            response.put("remaining", remaining);  // Thêm số câu hỏi còn lại vào response
            response.put("completed", false);

            return ResponseEntity.ok(response);
        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", e.getMessage()
            ));
        }
    }


    @PostMapping("/submit-answer")
    public ResponseEntity<?> submitAnswer(@RequestBody Map<String, Object> payload) {
        try {
            Object vocabIdObj = payload.get("vocabId");
            System.out.println("ID từ vựng nhận được: " + vocabIdObj);

            Object selectedIndexObj = payload.get("selectedIndex");
            System.out.println("Chỉ mục được chọn: " + selectedIndexObj);

            if (!(vocabIdObj instanceof Number) || !(selectedIndexObj instanceof Number)) {
                System.out.println("Dữ liệu đầu vào không hợp lệ");

                return ResponseEntity.badRequest().body(Map.of(
                        "error", "Dữ liệu đầu vào không hợp lệ"
                ));
            }

            Long vocabId = ((Number) vocabIdObj).longValue();
            int selectedIndex = ((Number) selectedIndexObj).intValue();

            System.out.println("Xử lý với vocabId: " + vocabId + ", selectedIndex: " + selectedIndex);

            boolean isCorrect = vocabService.handleAnswer(vocabId, selectedIndex);

            System.out.println("Kết quả trả lời đúng hay không: " + isCorrect);
            System.out.println("Số lượng từ còn lại: " + vocabService.getRemainingCount());

            return ResponseEntity.ok().body(Map.of(
                    "correct", isCorrect,
                    "remaining", vocabService.getRemainingCount()
            ));
        } catch (Exception e) {
            System.out.println("Lỗi xảy ra: " + e.getMessage());
            return ResponseEntity.badRequest().body(Map.of(
                    "error", e.getMessage()
            ));
        }
    }




    @GetMapping("/has-more")
    public ResponseEntity<Boolean> hasMoreQuestions() {
        return ResponseEntity.ok(vocabService.hasMoreVocabs());
    }

    @GetMapping("/remaining")
    public ResponseEntity<Integer> getRemainingQuestions() {
        return ResponseEntity.ok(vocabService.getRemainingCount());
    }
}