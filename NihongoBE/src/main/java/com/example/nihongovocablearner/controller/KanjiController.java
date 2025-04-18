package com.example.nihongovocablearner.controller;

import com.example.nihongovocablearner.entity.Kanji;
import com.example.nihongovocablearner.service.KanjiService;
import com.example.nihongovocablearner.service.LessonService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/kanji")
public class KanjiController {

    private final KanjiService kanjiService;
    private final LessonService lessonService;

    public KanjiController(KanjiService kanjiService, LessonService lessonService) {
        this.kanjiService = kanjiService;
        this.lessonService = lessonService;
    }

    @PostMapping("/new-kanji")
    public ResponseEntity<?> createNewKanji(
            @RequestBody Kanji kanji,
            @RequestParam("idLesson") Long idLesson) {

        kanji.setLesson(lessonService.findById(idLesson));
        kanjiService.save(kanji);
        return ResponseEntity.ok("Kanji created successfully");
    }

    @GetMapping("/lesson/{lessonId}")
    public ResponseEntity<List<Kanji>> getKanjiByLesson(@PathVariable Long lessonId) {
        return ResponseEntity.ok(kanjiService.findByLessonId(lessonId));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteKanji(@PathVariable Long id) {
        kanjiService.delete(id);
        return ResponseEntity.ok("Kanji deleted successfully");
    }
}