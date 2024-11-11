package com.example.nihongovocablearner.controller;

import com.example.nihongovocablearner.entity.Lesson;
import com.example.nihongovocablearner.entity.Level;
import com.example.nihongovocablearner.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/level")
public class LevelController {
    @Autowired
    LevelService levelService;

    @GetMapping("/show-all")
    public ResponseEntity<?> showAllLevel() {
        return ResponseEntity.ok(levelService.findAll());
    }

    @GetMapping("/show-lessons-level/{idLevel}")
    public ResponseEntity<?> showLessonLevel(@PathVariable("idLevel") Long idLevel) {
       Level level = levelService.findById(idLevel);
        return ResponseEntity.ok(level.getLessons());
    }

    @PostMapping("/new-level")
    public ResponseEntity<?> createNewLevel(Level level) {
        levelService.save(level);
        return ResponseEntity.ok("Create new level successfully !");
    }

}
