package com.example.nihongovocablearner.service.impl;

import com.example.nihongovocablearner.entity.Vocab;
import com.example.nihongovocablearner.repository.VocabRepository;
import com.example.nihongovocablearner.service.VocabService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@Service
public class VocabServiceImpl implements VocabService {

    @Autowired
    VocabRepository vocabRepository;

    private QuizQuestion lastQuestion; // để nhớ câu hỏi gần nhất
    private List<Vocab> allVocabsForLesson = new ArrayList<>();


    @Override
    public void save(Vocab vocab) {
        vocabRepository.save(vocab);
    }

    @Override
    public void deleteById(Long id) {
        vocabRepository.deleteById(id);
    }

    @Override
    public Vocab findById(Long id) {
        return vocabRepository.findById(id).orElse(null);
    }

    @Override
    public List<Vocab> findAll() {
        return vocabRepository.findAll();
    }

    private List<Vocab> remainingVocabs = new ArrayList<>();

    // Lấy danh sách từ vựng cho bài học và khởi tạo remainingVocabs
    @Override
    public void initializeVocabsForLesson(Long lessonId) {
        this.allVocabsForLesson = vocabRepository.findByLessonId(lessonId);
        this.remainingVocabs = new ArrayList<>(allVocabsForLesson);
        Collections.shuffle(this.remainingVocabs);
    }




    @Override
    public VocabService.QuizQuestion getRandomVocabWithOptions() {
        if (remainingVocabs.isEmpty()) return null;

        Vocab currentVocab = remainingVocabs.get(0);

        // Lấy các từ khác từ danh sách gốc (đảm bảo luôn có đủ)
        List<Vocab> otherVocabs = new ArrayList<>(allVocabsForLesson);
        otherVocabs.removeIf(v -> v.getId().equals(currentVocab.getId())); // Loại từ đúng
        Collections.shuffle(otherVocabs);

        List<Vocab> wrongOptions = otherVocabs.size() >= 3
                ? otherVocabs.subList(0, 3)
                : otherVocabs;

        List<String> options = new ArrayList<>();
        options.add(currentVocab.getMeaning());
        for (Vocab vocab : wrongOptions) {
            options.add(vocab.getMeaning());
        }

        Collections.shuffle(options);
        int correctIndex = options.indexOf(currentVocab.getMeaning());

        lastQuestion = new VocabService.QuizQuestion(
                currentVocab.getId(),
                currentVocab.getWord(),
                options,
                correctIndex
        );

        return lastQuestion;
    }


    // Xử lý khi người dùng chọn đáp án
    @Override
    public boolean handleAnswer(Long vocabId, int selectedIndex) {
        if (lastQuestion == null || !lastQuestion.getVocabId().equals(vocabId)) {
            return false; // Không khớp với câu hỏi gần nhất
        }

        String selectedOption = lastQuestion.getOptions().get(selectedIndex);
        String correctAnswer = lastQuestion.getOptions().get(lastQuestion.getCorrectIndex());

        boolean isCorrect = selectedOption.equals(correctAnswer);

        // Nếu đúng thì cập nhật và loại bỏ từ khỏi danh sách
        if (isCorrect) {
            Vocab vocab = vocabRepository.findById(vocabId).orElse(null);
            if (vocab != null) {
                vocab.setCorrectCount(vocab.getCorrectCount() + 1);
                vocabRepository.save(vocab);
            }
            // Xóa từ khỏi remaining
            remainingVocabs.removeIf(v -> v.getId().equals(vocabId));
        }

        // Reset lastQuestion để tránh dùng lại
        lastQuestion = null;

        return isCorrect;
    }



    // Kiểm tra còn từ nào không
    public boolean hasMoreVocabs() {
        return !remainingVocabs.isEmpty();
    }

//    // DTO cho câu hỏi
//    @Getter
//    @AllArgsConstructor
//    public static class QuizQuestion {
//        private Long vocabId;
//        private String word;
//        private List<String> options;
//        private int correctIndex;
//    }
    public int getRemainingCount() {
        return remainingVocabs == null ? 0 : remainingVocabs.size();
    }



}
