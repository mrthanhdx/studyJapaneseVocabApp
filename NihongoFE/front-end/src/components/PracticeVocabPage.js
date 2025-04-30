import React, { useEffect, useState } from 'react';
import { Container, Button, Alert, Spinner } from 'react-bootstrap';
import '../styles/halloweenTheme.css';

const PracticeVocabPage = ({ lessonId, level, onBack }) => {
    const [currentQuestion, setCurrentQuestion] = useState(null);
    const [selectedIndex, setSelectedIndex] = useState(null);
    const [isCorrect, setIsCorrect] = useState(null);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);
    const [quizFinished, setQuizFinished] = useState(false);
    const [remainingQuestions, setRemainingQuestions] = useState(0);

    useEffect(() => {
        startQuiz();
    }, [lessonId]);

    const startQuiz = async () => {
        resetState();
        try {
            setIsLoading(true);
            const res = await fetch(`http://localhost:7070/api/vocab-quiz/start/${lessonId}`, { method: 'POST' });
            if (!res.ok) throw new Error((await res.json()).error || 'Failed to initialize quiz');
            await loadNextQuestion();
        } catch (err) {
            setError(err.message);
            setQuizFinished(true);
        } finally {
            setIsLoading(false);
        }
    };

    const resetState = () => {
        setCurrentQuestion(null);
        setSelectedIndex(null);
        setIsCorrect(null);
        setIsLoading(false);
        setError(null);
        setQuizFinished(false);
        setRemainingQuestions(0);
    };

    const loadNextQuestion = async () => {
        try {
            setIsLoading(true);
            const res = await fetch('http://localhost:7070/api/vocab-quiz/next-question');
            const data = await res.json();

            if (!res.ok) throw new Error(data.error || 'Failed to fetch question');
            if (data.completed) {
                setQuizFinished(true);
                setCurrentQuestion(null);
                return;
            }

            setCurrentQuestion(data);
            setRemainingQuestions(data.remaining || 0);
            setSelectedIndex(null);
            setIsCorrect(null);
        } catch (err) {
            setError(err.message);
        } finally {
            setIsLoading(false);
        }
    };

    const submitAnswer = async (index) => {
        if (selectedIndex !== null || !currentQuestion) return;

        try {
            setIsLoading(true);
            const res = await fetch('http://localhost:7070/api/vocab-quiz/submit-answer', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ vocabId: currentQuestion.vocabId, selectedIndex: index })
            });

            const result = await res.json();
            if (!res.ok) throw new Error(result.error || 'Failed to submit answer');

            setSelectedIndex(index);
            setIsCorrect(result.correct);
            setRemainingQuestions(result.remaining);

            if (result.correct) {
                if (result.remaining === 0) {
                    setTimeout(() => setQuizFinished(true), 500);
                } else {
                    setTimeout(() => loadNextQuestion(), 500);
                }
            }
        } catch (err) {
            setError(err.message);
        } finally {
            setIsLoading(false);
        }
    };

    if (isLoading && !currentQuestion) {
        return (
            <Container className="text-center mt-5">
                <Spinner animation="border" role="status" />
                <p>Preparing your quiz...</p>
            </Container>
        );
    }

    if (error) {
        return (
            <Container className="mt-5">
                <Alert variant="danger">
                    <Alert.Heading>Error</Alert.Heading>
                    <p>{error}</p>
                    <Button onClick={startQuiz}>Try Again</Button>
                </Alert>
            </Container>
        );
    }

    if (quizFinished) {
        return (
            <Container className="text-center mt-5">
                <h2>🎉 Quiz Completed!</h2>
                <p className="lead">You've finished all the questions!</p>
                <Button variant="primary" onClick={startQuiz}>Restart Quiz</Button>
                <Button variant="secondary" onClick={onBack} className="ms-2">Back to Lesson</Button>
            </Container>
        );
    }

    const correctAnswer = currentQuestion?.options[currentQuestion.correctIndex];

    return (
        <Container className="mt-5">
            <div className="d-flex justify-content-between align-items-center mb-4">
                <Button variant="outline-secondary" onClick={onBack}>← Back</Button>
                <small className="text-muted">{remainingQuestions} questions remaining</small>
            </div>

            <div className="text-center mb-4">
                <h4>What does this word mean?</h4>
                <h2 className="display-4 text-primary my-3">{currentQuestion?.word}</h2>
            </div>

            <div className="quiz-options-grid mb-4">
                {currentQuestion?.options.map((option, index) => {
                    const isSelectedOption = selectedIndex === index;
                    const showCorrect = isSelectedOption && !isCorrect;

                    return (
                        <button
                            key={index}
                            onClick={() => submitAnswer(index)}
                            disabled={selectedIndex !== null && !isSelectedOption}
                            className={`quiz-option-btn rounded-pill py-3 px-4 m-2 ${
                                isSelectedOption ? (isCorrect ? 'correct' : 'wrong') : ''
                            }`}
                        >
                            <div className="d-flex flex-column align-items-center">
                                <span className="fs-5 fw-medium">{option}</span>
                                {showCorrect && (
                                    <small className="text-white mt-1">Correct: {correctAnswer}</small>
                                )}
                            </div>
                        </button>
                    );
                })}
            </div>

            {selectedIndex !== null && !isCorrect && (
                <div className="text-end">
                    <Button onClick={() => {
                        setSelectedIndex(null);
                        setIsCorrect(null);
                        loadNextQuestion();
                    }}>
                        Continue
                    </Button>
                </div>
            )}
        </Container>
    );
};

export default PracticeVocabPage;
