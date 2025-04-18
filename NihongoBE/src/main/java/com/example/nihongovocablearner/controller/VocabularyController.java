package com.example.nihongovocablearner.controller;


import com.example.nihongovocablearner.dto.VocabDto;
import com.example.nihongovocablearner.entity.Lesson;
import com.example.nihongovocablearner.entity.Vocab;
import com.example.nihongovocablearner.service.LessonService;
import com.example.nihongovocablearner.service.UploadToCloudinary;
import com.example.nihongovocablearner.service.VocabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/vocab")
public class VocabularyController {
    @Autowired
    VocabService vocabService;

    @Autowired
    UploadToCloudinary uploadToCloudinary;
    @Autowired
    LessonService lessonService;

    @GetMapping("/show-all")
    public ResponseEntity<?> showAllLesson() {
        return ResponseEntity.ok(vocabService.findAll());
    }

    @PostMapping("/new-vocab")
    public ResponseEntity<?> createNewLesson(
            @RequestBody VocabDto vocabDto,  // Accept JSON body
            @RequestParam("idLesson") Long idLesson) throws IOException {

        System.out.println("Received: " + vocabDto);

        Lesson lesson = lessonService.findById(idLesson);

        Vocab vocab = new Vocab();
        vocab.setWord(vocabDto.getWord());
        vocab.setRomanji(vocabDto.getRomanji());
        vocab.setMeaning(vocabDto.getMeaning());
        vocab.setLesson(lesson);

        vocabService.save(vocab);
        return ResponseEntity.ok("Vocabulary created successfully");
    }

    @DeleteMapping("/delete-vocab/{idVocab}")
    public ResponseEntity<?> deleteVocabulary(@PathVariable("idVocab") Long idVocab) {
        vocabService.deleteById(idVocab);
        return ResponseEntity.ok("Delete vocabulary successfully !");
    }
}
