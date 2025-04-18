import React from 'react';

const PracticeKanjiPage = ({ lessonId, onBack }) => {


    return (
        <div>
            <h1>Practice Kanji Lesson:{lessonId}</h1>
            <p>Start practicing your Kanji here!</p>
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

export default PracticeKanjiPage;