package com.example.nihongovocablearner.controller;

import com.example.nihongovocablearner.entity.Lesson;
import com.example.nihongovocablearner.entity.Level;
import com.example.nihongovocablearner.service.LessonService;
import com.example.nihongovocablearner.service.LevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/lesson")
public class LessonController {
    @Autowired
    LessonService lessonService;

    @Autowired
    LevelService levelService;

    @GetMapping("/show-all")
    public ResponseEntity<?> showAllLesson() {
        return ResponseEntity.ok(lessonService.findAll());
    }

    @GetMapping("/{idLesson}")
    public ResponseEntity<?> getLessonById(@PathVariable Long idLesson) {
        return ResponseEntity.ok(lessonService.findById(idLesson));
    }

    @GetMapping("/show-vocab-lesson/{idLesson}")
    public ResponseEntity<?> showVocabLesson(@PathVariable("idLesson") Long idLesson) {
        Lesson lesson = lessonService.findById(idLesson);
        return ResponseEntity.ok(lesson.getVocabList());
    }

    @PostMapping("/new-lesson")
    public ResponseEntity<?> createNewLesson(@RequestBody Lesson lesson, @RequestParam("idLevel") Long idLevel) {
        Level level = levelService.findById(idLevel);
        lesson.setLevel(level);
        lessonService.save(lesson);
        return ResponseEntity.ok("Create new lesson successfully!");
    }


}
