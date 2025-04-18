import React from 'react';

const PracticeVocabPage = ({ lessonId, onBack }) => {
    return (
        <div style={{ padding: '20px' }}>
            <h2>Practice Vocabulary - Lesson {lessonId}</h2>
            <p>Here is where you can practice your vocabulary!</p>

            <button
                style={{
                    marginTop: '20px',
                    padding: '10px 20px',
                    backgroundColor: '#28a745',
                    color: '#fff',
                    border: 'none',
                    borderRadius: '4px',
                    cursor: 'pointer',
                }}
                onClick={onBack}
            >
                Quay lại
            </button>
        </div>
    );
};

export default PracticeVocabPage;
