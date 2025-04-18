package com.example.nihongovocablearner.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "kanji")
@Getter
@Setter
public class Kanji {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "character",columnDefinition = "NVARCHAR(255)")
    private String character; // The actual kanji character

    @Column(name = "hiragana", columnDefinition = "NVARCHAR(255)")
    private String hiragana; // Hiragana reading

    @Column(name = "meaning")
    private String meaning;

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    @JsonIgnore
    private Lesson lesson;
}