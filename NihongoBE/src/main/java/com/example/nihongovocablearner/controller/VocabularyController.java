package com.example.nihongovocablearner.controller;


import com.example.nihongovocablearner.entity.Lesson;
import com.example.nihongovocablearner.entity.Vocab;
import com.example.nihongovocablearner.service.LessonService;
import com.example.nihongovocablearner.service.UploadToCloudinary;
import com.example.nihongovocablearner.service.VocabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
    public ResponseEntity<?> createNewLesson(Vocab vocab, @RequestParam(name = "vocabImg",required = false) MultipartFile vocabImg , @RequestParam("idLesson") Long idLesson) throws IOException {
        Lesson lesson = lessonService.findById(idLesson);
        vocab.setLesson(lesson);
       if (vocabImg!=null) {
           String path = uploadToCloudinary.uploadImage(vocabImg);
           vocab.setImagePath(path);
       }
        vocabService.save(vocab);
        return ResponseEntity.ok("Create new vocabulary successfully !");
    }

    @DeleteMapping("/delete-vocab/{idVocab}")
    public ResponseEntity<?> deleteVocabulary(@PathVariable("idVocab") Long idVocab) {
        vocabService.deleteById(idVocab);
        return ResponseEntity.ok("Delete vocabulary successfully !");
    }
}
