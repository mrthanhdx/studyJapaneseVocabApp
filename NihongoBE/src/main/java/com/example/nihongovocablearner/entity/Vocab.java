package com.example.nihongovocablearner.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "vocabulary")
public class Vocab {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "word", nullable = false)
    private String word;
    @Column(name = "romanji")
    private String romanji;

    @Column(name = "meaning", nullable = false)
    private String meaning;

    @Column(name = "image_path")
    private String imagePath;

    @Column(name = "correct_count", nullable = false)
    private int correctCount = 0; // counts the number of times the word is answered correctly

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    @JsonIgnore
    private Lesson lesson;

    // Getters and Setters
}
