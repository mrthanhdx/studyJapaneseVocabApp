import React, { useState, useEffect } from 'react';

const SelectLessonPage = ({ onSelectLesson, level }) => {
    const [lessons, setLessons] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const [levelId, setLevelId] = useState(null);
  
    const [lessonName, setLessonName] = useState('');
    const [lessonNumber, setLessonNumber] = useState('');
    const [creating, setCreating] = useState(false);
  
    useEffect(() => {
      // First fetch all levels to find the ID for our selected level name
      const fetchLevelId = async () => {
        try {
          const response = await fetch('http://localhost:7070/level/show-all');
          if (!response.ok) throw new Error('Failed to fetch levels');
          const levels = await response.json();
          const foundLevel = levels.find(l => l.name === level);
          if (!foundLevel) throw new Error('Level not found');
          setLevelId(foundLevel.id);
          fetchLessons(foundLevel.id);
        } catch (err) {
          setError(err.message || 'Something went wrong');
          setLoading(false);
        }
      };
  
      fetchLevelId();
    }, [level]);
  
    const fetchLessons = async (id) => {
      setLoading(true);
      try {
        const response = await fetch(`http://localhost:7070/level/show-lessons-level/${id}`);
        if (!response.ok) throw new Error('Failed to fetch lessons');
        const data = await response.json();
        setLessons(data);
      } catch (err) {
        setError(err.message || 'Something went wrong');
      } finally {
        setLoading(false);
      }
    };
  
    const handleCreateLesson = async () => {
      if (!lessonName.trim() || !lessonNumber.trim() || !levelId) {
        alert('Please fill in all fields');
        return;
      }
  
      setCreating(true);
      try {
        const response = await fetch(`http://localhost:7070/lesson/new-lesson?idLevel=${levelId}`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ 
            lessonName, 
            lessonNumber: parseInt(lessonNumber) 
          }),
        });
  
        if (!response.ok) throw new Error('Failed to create new lesson');
  
        alert('Lesson created successfully!');
        setLessonName('');
        setLessonNumber('');
        fetchLessons(levelId);
        window.bootstrap.Modal.getInstance(document.getElementById('createLessonModal')).hide();
      } catch (err) {
        alert(err.message || 'Failed to create lesson');
      } finally {
        setCreating(false);
      }
    };

  return (
    <div className="container mt-4">
      <h2 className="mb-3">Lesson List - JLPT {level}</h2>

      <button
        className="btn btn-primary mb-3"
        data-bs-toggle="modal"
        data-bs-target="#createLessonModal"
      >
        + Create New Lesson
      </button>

      <div className="modal fade" id="createLessonModal" tabIndex="-1" aria-hidden="true">
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title">Create New Lesson for {level}</h5>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close" />
            </div>
            <div className="modal-body">
              <div className="mb-3">
                <label className="form-label">Lesson Name</label>
                <input
                  type="text"
                  className="form-control"
                  value={lessonName}
                  onChange={(e) => setLessonName(e.target.value)}
                />
              </div>
              <div className="mb-3">
                <label className="form-label">Lesson Number</label>
                <input
                  type="number"
                  className="form-control"
                  value={lessonNumber}
                  onChange={(e) => setLessonNumber(e.target.value)}
                />
              </div>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">
                Cancel
              </button>
              <button
                type="button"
                className="btn btn-success"
                onClick={handleCreateLesson}
                disabled={creating}
              >
                {creating ? 'Creating...' : 'Create'}
              </button>
            </div>
          </div>
        </div>
      </div>

      {loading ? (
        <div className="text-center mt-4">Loading...</div>
      ) : error ? (
        <div className="alert alert-danger mt-4">Error: {error}</div>
      ) : lessons.length > 0 ? (
        <ul className="list-group">
          {lessons.map((lesson) => (
            <li
              key={lesson.id}
              className="list-group-item list-group-item-action text-primary"
              style={{ cursor: 'pointer' }}
              onClick={() => onSelectLesson(lesson.id)}
            >
              {lesson.lessonName || 'Untitled Lesson'}
            </li>
          ))}
        </ul>
      ) : (
        <div className="alert alert-info mt-4">No lessons found for {level} level</div>
      )}
    </div>
  );
};

export default SelectLessonPage;