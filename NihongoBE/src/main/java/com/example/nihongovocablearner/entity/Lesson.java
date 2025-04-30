package com.example.nihongovocablearner.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "lessons")
public class Lesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "lesson_name", nullable = false,columnDefinition = "NVARCHAR(255)")
    private String lessonName;

    @Column(name = "lesson_number", nullable = false)
    private int lessonNumber;

    @ManyToOne
    @JoinColumn(name = "level_id")
    @JsonIgnore
    private Level level;

    @OneToMany(mappedBy = "lesson", cascade = CascadeType.ALL)
    private List<Vocab> vocabList;

    // Getters and Setters
}
