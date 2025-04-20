package com.example.nihongovocablearner.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "vocabulary")
@ToString
public class Vocab {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "word", nullable = true,columnDefinition = "NVARCHAR(255)")
    private String word;
    @Column(name = "romanji")
    private String romanji;

    @Column(name = "meaning", nullable = true,columnDefinition = "NVARCHAR(255)")
    private String meaning;

    @Column(name = "image_path")
    private String imagePath;

    @Column(name = "correct_count", nullable = true)
    private int correctCount = 0; // counts the number of times the word is answered correctly

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    @JsonIgnore
    private Lesson lesson;

    // Getters and Setters
}
