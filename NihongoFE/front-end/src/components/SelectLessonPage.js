import React, { useState, useEffect } from 'react';
import { 
  Container, 
  Button, 
  Modal, 
  Form, 
  ListGroup, 
  Spinner, 
  Alert, 
  Badge,
  Row,
  Col
} from 'react-bootstrap';

const SelectLessonPage = ({ onSelectLesson, level }) => {
  const [lessons, setLessons] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [levelId, setLevelId] = useState(null);
  const [showModal, setShowModal] = useState(false);
  const [formData, setFormData] = useState({
    name: '',
    number: ''
  });

  useEffect(() => {
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

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleCreateLesson = async () => {
    if (!formData.name.trim() || !formData.number.trim() || !levelId) {
      alert('Please fill in all fields');
      return;
    }

    try {
      const response = await fetch(`http://localhost:7070/lesson/new-lesson?idLevel=${levelId}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ 
          lessonName: formData.name,
          lessonNumber: parseInt(formData.number) 
        }),
      });

      if (!response.ok) throw new Error('Failed to create new lesson');

      setFormData({ name: '', number: '' });
      setShowModal(false);
      fetchLessons(levelId);
    } catch (err) {
      alert(err.message || 'Failed to create lesson');
    }
  };

  return (
    <Container className="py-4">
      <Row className="align-items-center mb-4">
        <Col>
          <h2 className="mb-0">
            <Badge bg="secondary" className="me-2">JLPT {level}</Badge>
            Lesson List
          </h2>
        </Col>
        <Col xs="auto">
          <Button 
            variant="primary" 
            onClick={() => setShowModal(true)}
            className="d-flex align-items-center"
          >
            <i className="bi bi-plus-lg me-2"></i> New Lesson
          </Button>
        </Col>
      </Row>

      {error && (
        <Alert variant="danger" className="mt-3">
          <i className="bi bi-exclamation-triangle-fill me-2"></i>
          {error}
        </Alert>
      )}

      {loading ? (
        <div className="text-center py-5">
          <Spinner animation="border" variant="primary" />
          <p className="mt-2">Loading lessons...</p>
        </div>
      ) : lessons.length > 0 ? (
        <ListGroup variant="flush" className="shadow-sm">
          {lessons.map((lesson) => (
            <ListGroup.Item 
              key={lesson.id}
              action 
              onClick={() => onSelectLesson(lesson.id)}
              className="py-3 d-flex justify-content-between align-items-center"
            >
              <div>
                <span className="text-muted me-2">Lesson {lesson.lessonNumber}:</span>
                <strong>{lesson.lessonName || 'Untitled Lesson'}</strong>
              </div>
              <i className="bi bi-chevron-right text-primary"></i>
            </ListGroup.Item>
          ))}
        </ListGroup>
      ) : (
        <Alert variant="info" className="mt-4">
          <i className="bi bi-info-circle-fill me-2"></i>
          No lessons found for {level} level
        </Alert>
      )}

      {/* Create Lesson Modal */}
      <Modal show={showModal} onHide={() => setShowModal(false)} centered>
        <Modal.Header closeButton>
          <Modal.Title>Create New Lesson</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3">
              <Form.Label>Lesson Number</Form.Label>
              <Form.Control
                type="number"
                name="number"
                value={formData.number}
                onChange={handleInputChange}
                placeholder="e.g. 1, 2, 3..."
              />
            </Form.Group>
            <Form.Group className="mb-3">
              <Form.Label>Lesson Name</Form.Label>
              <Form.Control
                type="text"
                name="name"
                value={formData.name}
                onChange={handleInputChange}
                placeholder="e.g. Greetings, Verbs..."
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => setShowModal(false)}>
            Cancel
          </Button>
          <Button variant="primary" onClick={handleCreateLesson}>
            Create Lesson
          </Button>
        </Modal.Footer>
      </Modal>
    </Container>
  );
};

export default SelectLessonPage;