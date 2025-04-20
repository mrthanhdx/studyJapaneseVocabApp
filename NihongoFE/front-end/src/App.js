import logo from './logo.svg';
import './App.css';
import ContainerApp from './components/ContainerApp';
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import VocabQuiz from './components/PracticeVocabPage'; // hoặc PracticeVocabPage nếu bạn dùng tên này
import LessonPage from './components/LessonPage'; // nhớ tạo file này hoặc import đúng

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route path="/quiz/:lessonId" element={<VocabQuiz />} />
          <Route path="/lesson/:lessonId" element={<LessonPage />} />
          <Route path="/*" element={<ContainerApp />} /> {/* Trang mặc định */}
        </Routes>
      </Router>
    </div>
  );
}

export default App;

