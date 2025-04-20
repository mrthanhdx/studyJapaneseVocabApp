package com.example.nihongovocablearner.service.impl;

import com.example.nihongovocablearner.entity.Kanji;
import com.example.nihongovocablearner.repository.KanjiRepository;
import com.example.nihongovocablearner.service.KanjiService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class KanjiServiceImpl implements KanjiService {

    @Autowired
    private KanjiRepository kanjiRepository;

    private List<Kanji> allKanjisForLesson = new ArrayList<>();
    private List<Kanji> remainingKanjis = new ArrayList<>();
    private QuizQuestion lastQuestion;

    @Override
    public void save(Kanji kanji) {
        kanjiRepository.save(kanji);
    }

    @Override
    public void deleteById(Long id) {
        kanjiRepository.deleteById(id);
    }

    @Override
    public Kanji findById(Long id) {
        return kanjiRepository.findById(id).orElse(null);
    }

    @Override
    public List<Kanji> findAll() {
        return kanjiRepository.findAll();
    }

    @Override
    public void initializeKanjisForLesson(Long lessonId) {
        this.allKanjisForLesson = kanjiRepository.findByLessonId(lessonId);
        this.remainingKanjis = new ArrayList<>(allKanjisForLesson);
        Collections.shuffle(this.remainingKanjis);
    }

    @Override
    public KanjiService.QuizQuestion getRandomKanjiWithOptions() {
        if (remainingKanjis.isEmpty()) return null;

        Kanji currentKanji = remainingKanjis.get(0);

        List<Kanji> otherKanjis = new ArrayList<>(allKanjisForLesson);
        otherKanjis.removeIf(k -> k.getId().equals(currentKanji.getId()));
        Collections.shuffle(otherKanjis);

        List<Kanji> wrongOptions = otherKanjis.size() >= 3
                ? otherKanjis.subList(0, 3)
                : otherKanjis;

        List<String> options = new ArrayList<>();
        options.add(currentKanji.getHiragana());
        for (Kanji kanji : wrongOptions) {
            options.add(kanji.getHiragana());
        }

        Collections.shuffle(options);
        int correctIndex = options.indexOf(currentKanji.getHiragana());

        lastQuestion = new QuizQuestion(
                currentKanji.getId(),
                currentKanji.getCharacter(),
                options,
                correctIndex
        );

        return lastQuestion;
    }

    @Override
    public boolean handleAnswer(Long kanjiId, int selectedIndex) {
        if (lastQuestion == null || !lastQuestion.getKanjiId().equals(kanjiId)) {
            return false;
        }

        String selected = lastQuestion.getOptions().get(selectedIndex);
        String correct = lastQuestion.getOptions().get(lastQuestion.getCorrectIndex());

        boolean isCorrect = selected.equals(correct);
        if (isCorrect) {
            remainingKanjis.removeIf(k -> k.getId().equals(kanjiId));
        }

        lastQuestion = null;
        return isCorrect;
    }

    @Override
    public boolean hasMoreKanjis() {
        return !remainingKanjis.isEmpty();
    }

    @Override
    public int getRemainingCount() {
        return remainingKanjis == null ? 0 : remainingKanjis.size();
    }

    @Override
    public List<Kanji> findByLessonId(Long id) {
        return kanjiRepository.findByLessonId(id);
    }

    @Override
    public void delete(Long id) {
        kanjiRepository.deleteById(id);
    }
}
