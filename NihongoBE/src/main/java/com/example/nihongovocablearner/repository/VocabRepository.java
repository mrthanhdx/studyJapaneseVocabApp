package com.example.nihongovocablearner.repository;

import com.example.nihongovocablearner.entity.Vocab;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VocabRepository extends JpaRepository<Vocab,Long> {
}
