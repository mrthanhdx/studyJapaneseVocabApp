import React, { useState, useEffect } from 'react';
import { Container, Button, Alert, Spinner } from 'react-bootstrap';
import '../styles/halloweenTheme.css'; // nếu file nằm trong thư mục styles

const PracticeVocabPage = ({ lessonId, level, onBack }) => {
    const [quizState, setQuizState] = useState({
        currentQuestion: null,
        selectedIndex: null,
        isCorrect: null,
        isLoading: false,
        error: null,
        quizFinished: false,
        remainingQuestions: 0
    });

    const startQuiz = async () => {
        try {
            setQuizState(prev => ({ ...prev, isLoading: true, error: null }));
            const startResponse = await fetch(`http://localhost:7070/api/vocab-quiz/start/${lessonId}`, {
                method: 'POST'
            });

            if (!startResponse.ok) {
                const errorData = await startResponse.json();
                throw new Error(errorData.error || 'Failed to initialize quiz');
            }

            await fetchQuestion();
        } catch (err) {
            setQuizState(prev => ({
                ...prev,
                error: err.message,
                quizFinished: true
            }));
        } finally {
            setQuizState(prev => ({ ...prev, isLoading: false }));
        }
    };

    const restartQuiz = () => {
        setQuizState({
            currentQuestion: null,
            selectedIndex: null,
            isCorrect: null,
            isLoading: false,
            error: null,
            quizFinished: false,
            remainingQuestions: 0
        });

        startQuiz();
    };

    const fetchQuestion = async () => {
        try {
            setQuizState(prev => ({ ...prev, isLoading: true }));
            const response = await fetch('http://localhost:7070/api/vocab-quiz/next-question');
            const data = await response.json();

            if (!response.ok) {
                throw new Error(data.error || 'Failed to fetch question');
            }

            if (data.completed) {
                setQuizState(prev => ({
                    ...prev,
                    quizFinished: true,
                    currentQuestion: null
                }));
                return;
            }

            setQuizState(prev => ({
                ...prev,
                currentQuestion: data,
                selectedIndex: null,
                isCorrect: null,
                remainingQuestions: data.remaining || 0
            }));
        } catch (err) {
            setQuizState(prev => ({ ...prev, error: err.message }));
        } finally {
            setQuizState(prev => ({ ...prev, isLoading: false }));
        }
    };

    const handleAnswer = async (selectedIndex) => {
        if (quizState.selectedIndex !== null || !quizState.currentQuestion) return;

        try {
            setQuizState(prev => ({ ...prev, isLoading: true }));

            const response = await fetch('http://localhost:7070/api/vocab-quiz/submit-answer', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    vocabId: quizState.currentQuestion.vocabId,
                    selectedIndex
                })
            });

            const result = await response.json();

            if (!response.ok) {
                throw new Error(result.error || 'Failed to submit answer');
            }

            const isCorrect = result.correct;
            const remaining = result.remaining;

            setQuizState(prev => ({
                ...prev,
                selectedIndex,
                isCorrect,
                remainingQuestions: remaining,
                quizFinished: !isCorrect && remaining === 0
            }));

            if (isCorrect) {
                if (remaining === 0) {
                    setTimeout(() => {
                        setQuizState(prev => ({
                            ...prev,
                            quizFinished: true
                        }));
                    }, 500);
                } else {
                    setTimeout(() => {
                        fetchQuestion();
                    }, 500);
                }
            }
        } catch (err) {
            setQuizState(prev => ({ ...prev, error: err.message }));
        } finally {
            setQuizState(prev => ({ ...prev, isLoading: false }));
        }
    };

    useEffect(() => {
        startQuiz();
    }, [lessonId]);

    if (quizState.isLoading && !quizState.currentQuestion) {
        return (
            <Container className="text-center mt-5">
                <Spinner animation="border" role="status" />
                <p>Preparing your quiz...</p>
            </Container>
        );
    }

    if (quizState.error) {
        return (
            <Container className="mt-5">
                <Alert variant="danger">
                    <Alert.Heading>Error</Alert.Heading>
                    <p>{quizState.error}</p>
                    <Button variant="primary" onClick={restartQuiz}>Try Again</Button>
                </Alert>
            </Container>
        );
    }

    if (quizState.quizFinished) {
        return (
            <Container className="text-center mt-5">
                <h2>🎉 Quiz Completed!</h2>
                <p className="lead">You've finished all the questions!</p>
                <Button variant="primary" onClick={restartQuiz}>Restart Quiz</Button>
                <Button variant="secondary" onClick={onBack} className="ms-2">Back to Lesson</Button>
            </Container>
        );
    }

    return (
        <Container className="mt-5">
            <div className="d-flex justify-content-between align-items-center mb-4">
                <Button variant="outline-secondary" onClick={onBack}>← Back</Button>
                <small className="text-muted">{quizState.remainingQuestions} questions remaining</small>
            </div>

            <div className="mb-4 text-center">
                <h4>What does this word mean?</h4>
                <h2 className="display-4 text-primary my-3">{quizState.currentQuestion?.word}</h2>
            </div>

            <div className="quiz-options-grid mb-4">
                {quizState.currentQuestion?.options.map((option, index) => {
                    const isSelected = quizState.selectedIndex === index;
                    const isCorrect = quizState.isCorrect;
                    const correctAnswer = quizState.currentQuestion.options[quizState.currentQuestion.correctIndex];
                    const showCorrect = isSelected && !isCorrect;

                    return (
                        <button
                            variant="primary"
                            key={index}
                            onClick={() => handleAnswer(index)}
                            disabled={quizState.selectedIndex !== null && !isSelected}
                            className={`quiz-option-btn rounded-pill py-3 px-4 m-2 ${isSelected ? (isCorrect ? 'correct' : 'wrong') : ''
                                }`}
                        >
                            <div className="d-flex flex-column align-items-center">
                                <span className="fs-5 fw-medium">{option}</span>
                                {showCorrect && (
                                    <small className="text-white mt-1">
                                        Correct: {correctAnswer}
                                    </small>
                                )}
                            </div>
                        </button>
                    );
                })}
            </div>

            {quizState.selectedIndex !== null && !quizState.isCorrect && (
                <div className="text-end">
                    <Button variant="primary" onClick={() => {
                        setQuizState(prev => ({
                            ...prev,
                            selectedIndex: null,
                            isCorrect: null
                        }));
                        fetchQuestion();
                    }}>
                        Continue
                    </Button>
                </div>
            )}
        </Container>
    );
};

export default PracticeVocabPage;
