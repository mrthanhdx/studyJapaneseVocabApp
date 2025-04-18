package com.example.nihongovocablearner.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VocabDto {
    private String word;
    private String romanji;
    private String meaning;

    // getters and setters
}