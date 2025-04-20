package com.example.nihongovocablearner.controller;

import com.example.nihongovocablearner.entity.Level;
import com.example.nihongovocablearner.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/level")
@CrossOrigin(origins = "http://localhost:3000") // Cho phép React frontend truy cập
public class LevelController {

    @Autowired
    private LevelService levelService;

    // Lấy tất cả các level
    @GetMapping("/show-all")
    public ResponseEntity<List<Level>> showAllLevels() {
        List<Level> levels = levelService.findAll();
        return ResponseEntity.ok(levels);
    }

    // Lấy danh sách bài học theo id level
    @GetMapping("/show-lessons-level/{idLevel}")
    public ResponseEntity<?> showLessonLevel(@PathVariable("idLevel") Long idLevel) {
        Level level = levelService.findById(idLevel);
        if (level == null) {
            return ResponseEntity.badRequest().body("Level not found with ID: " + idLevel);
        }
        return ResponseEntity.ok(level.getLessons());
    }

    // Tạo level mới
    @PostMapping("/new-level")
    public ResponseEntity<?> createNewLevel(@RequestBody Level level) {
        if (level.getName() == null || level.getName().trim().isEmpty()) {
            return ResponseEntity.badRequest().body("Level name is required.");
        }
        levelService.save(level);
        return ResponseEntity.ok("Create new level successfully!");
    }
}
