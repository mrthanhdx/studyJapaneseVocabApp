import React, { useState } from 'react';
import SelectLessonPage from './SelectLessonPage';
import LessonPage from './LessonPage';

const MainLessonPage = ({ level }) => {
  const [selectedLessonId, setSelectedLessonId] = useState(null);

  const handleBack = () => {
    setSelectedLessonId(null);
  };

  return (
    <>
      {selectedLessonId ? (
        <LessonPage lessonId={selectedLessonId} onBack={handleBack} level={level} />
      ) : (
        <SelectLessonPage onSelectLesson={setSelectedLessonId} level={level} />
      )}
    </>
  );
};

export default MainLessonPage;