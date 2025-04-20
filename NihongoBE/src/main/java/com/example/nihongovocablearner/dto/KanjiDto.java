package com.example.nihongovocablearner.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KanjiDto {
    private String character;
    private String hiragana;
    private String meaning;
}