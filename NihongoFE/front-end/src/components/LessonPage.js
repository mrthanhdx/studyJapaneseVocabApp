import React, { useState, useEffect } from 'react';
import PracticeVocabPage from './PracticeVocabPage';
import PracticeKanjiPage from './PracticeKanjiPage';
import { Modal, Button, Card, ListGroup, Spinner, Alert } from 'react-bootstrap';
import { Trash } from 'react-bootstrap-icons';
import 'bootstrap/dist/css/bootstrap.min.css';

const LessonPage = ({ lessonId, lessonNumber, onBack, level }) => {
    const [currentPage, setCurrentPage] = useState('lesson');
    const [vocabList, setVocabList] = useState([]);
    const [kanjiList, setKanjiList] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const [lessonInfo, setLessonInfo] = useState(null);

    // New vocab modal state
    const [showVocabModal, setShowVocabModal] = useState(false);
    const [newVocab, setNewVocab] = useState({
        word: '',
        romanji: '',
        meaning: '',
        imagePath: ''
    });

    // New kanji modal state
    const [showKanjiModal, setShowKanjiModal] = useState(false);
    const [newKanji, setNewKanji] = useState({
        character: '',
        hiragana: '',
        meaning: ''
    });

    // Delete confirmation modal state
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [itemToDelete, setItemToDelete] = useState(null);
    const [isDeletingVocab, setIsDeletingVocab] = useState(true); // true for vocab, false for kanji

    useEffect(() => {
        const fetchLessonData = async () => {
            try {
                setLoading(true);
                // Fetch vocabulary
                const vocabResponse = await fetch(`http://localhost:7070/lesson/show-vocab-lesson/${lessonId}`);
                if (!vocabResponse.ok) throw new Error('Failed to fetch vocabulary');
                const vocabData = await vocabResponse.json();
                setVocabList(vocabData);

                // Fetch kanji
                const kanjiResponse = await fetch(`http://localhost:7070/kanji/lesson/${lessonId}`);
                if (!kanjiResponse.ok) throw new Error('Failed to fetch kanji');
                const kanjiData = await kanjiResponse.json();
                setKanjiList(kanjiData);

            } catch (err) {
                setError(err.message);
            } finally {
                setLoading(false);
            }

            const lessonResponse = await fetch(`http://localhost:7070/lesson/${lessonId}`);
            if (!lessonResponse.ok) throw new Error('Failed to fetch lesson info');
            const lessonData = await lessonResponse.json();
            setLessonInfo(lessonData);
        };

        fetchLessonData();
    }, [lessonId]);

    const handleVocabChange = (e) => {
        const { name, value } = e.target;
        setNewVocab(prev => ({
            ...prev,
            [name]: value
        }));
    };

    const handleKanjiChange = (e) => {
        const { name, value } = e.target;
        setNewKanji(prev => ({
            ...prev,
            [name]: value
        }));
    };

    const handleAddVocab = async () => {
        if (!newVocab.word || !newVocab.meaning) {
            setError('Word and Meaning are required fields');
            return;
        }

        try {
            const response = await fetch(`http://localhost:7070/vocab/new-vocab?idLesson=${lessonId}`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(newVocab)
            });

            if (!response.ok) throw new Error('Failed to add vocabulary');

            // Refresh the vocabulary list
            const vocabResponse = await fetch(`http://localhost:7070/lesson/show-vocab-lesson/${lessonId}`);
            const vocabData = await vocabResponse.json();
            setVocabList(vocabData);

            // Reset form and close modal
            setNewVocab({
                word: '',
                romanji: '',
                meaning: ''
            });
            setShowVocabModal(false);
        } catch (err) {
            setError(err.message);
        }
    };

    const handleAddKanji = async () => {
        if (!newKanji.character || !newKanji.hiragana || !newKanji.meaning) {
            setError('All fields are required for kanji');
            return;
        }

        try {
            const response = await fetch(`http://localhost:7070/kanji/new-kanji?idLesson=${lessonId}`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(newKanji)
            });

            if (!response.ok) throw new Error('Failed to add kanji');

            // Refresh the kanji list
            const kanjiResponse = await fetch(`http://localhost:7070/kanji/lesson/${lessonId}`);
            const kanjiData = await kanjiResponse.json();
            setKanjiList(kanjiData);

            // Reset form and close modal
            setNewKanji({
                character: '',
                hiragana: '',
                meaning: ''
            });
            setShowKanjiModal(false);
        } catch (err) {
            setError(err.message);
        }
    };

    const handleDeleteClick = (item, isVocab) => {
        setItemToDelete(item);
        setIsDeletingVocab(isVocab);
        setShowDeleteModal(true);
    };

    const handleConfirmDelete = async () => {
        try {
            let endpoint = isDeletingVocab
                ? `http://localhost:7070/vocab/delete-vocab/${itemToDelete.id}`
                : `http://localhost:7070/kanji/delete/${itemToDelete.id}`;

            const response = await fetch(endpoint, {
                method: 'DELETE'
            });

            if (!response.ok) throw new Error(`Failed to delete ${isDeletingVocab ? 'vocabulary' : 'kanji'}`);

            // Refresh the appropriate list
            if (isDeletingVocab) {
                const vocabResponse = await fetch(`http://localhost:7070/lesson/show-vocab-lesson/${lessonId}`);
                const vocabData = await vocabResponse.json();
                setVocabList(vocabData);
            } else {
                const kanjiResponse = await fetch(`http://localhost:7070/kanji/lesson/${lessonId}`);
                const kanjiData = await kanjiResponse.json();
                setKanjiList(kanjiData);
            }

            // Close the modal
            setShowDeleteModal(false);
            setItemToDelete(null);
        } catch (err) {
            setError(err.message);
        }
    };

    if (currentPage === 'practiceVocab') {
        return <PracticeVocabPage lessonId={lessonId} level={level} onBack={() => setCurrentPage('lesson')} />;
    }

    if (currentPage === 'practiceKanji') {
        return <PracticeKanjiPage lessonId={lessonId} level={level} onBack={() => setCurrentPage('lesson')} />;
    }

    return (
        <div className="container mt-4" style={{paddingTop:'5px' }}>
            <div style={{marginBottom:'20px'}} className="d-flex gap-3 mt-4">
                <Button
                    variant="primary"
                    onClick={() => setCurrentPage('practiceVocab')}
                    disabled={vocabList.length === 0}
                >
                    Practice Vocabulary
                </Button>
                <Button
                    variant="warning"
                    onClick={() => setCurrentPage('practiceKanji')}
                    disabled={kanjiList.length === 0}
                >
                    Practice Kanji
                </Button>
            </div>
            
            <div className="d-flex justify-content-between align-items-center mb-4">
            <h2>Lesson {lessonInfo?.lessonNumber} - {level} Level</h2>
                <Button variant="outline-secondary" onClick={onBack}>
                    Back to Lessons
                </Button>
            </div>

            {error && <Alert variant="danger">{error}</Alert>}

            <div className="row">
                <div className="col-md-6">
                    <Card className="mb-4">
                        <Card.Header className="d-flex justify-content-between align-items-center">
                            <h5>Vocabulary</h5>
                            <Button
                                variant="primary"
                                size="sm"
                                onClick={() => setShowVocabModal(true)}
                            >
                                + Add Vocabulary
                            </Button>
                        </Card.Header>
                        <Card.Body>
                            {loading ? (
                                <div className="text-center">
                                    <Spinner animation="border" />
                                </div>
                            ) : (
                                <ListGroup variant="flush">
                                    {vocabList.length > 0 ? (
                                        vocabList.map((vocab, index) => (
                                            <ListGroup.Item key={index} className="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <strong>{vocab.word}</strong>
                                                    {vocab.romanji && <span className="text-muted ms-2">({vocab.romanji})</span>}
                                                    <div className="text-muted">{vocab.meaning}</div>
                                                </div>
                                                <div className="d-flex align-items-center">
                                                    {vocab.imagePath && (
                                                        <img
                                                            src={vocab.imagePath}
                                                            alt={vocab.word}
                                                            style={{ width: '50px', height: '50px', objectFit: 'cover', marginRight: '10px' }}
                                                        />
                                                    )}
                                                    <Button
                                                        variant="outline-danger"
                                                        size="sm"
                                                        onClick={() => handleDeleteClick(vocab, true)}
                                                        title="Delete vocabulary"
                                                    >
                                                        <Trash size={16} />
                                                    </Button>
                                                </div>
                                            </ListGroup.Item>
                                        ))
                                    ) : (
                                        <ListGroup.Item>No vocabulary available</ListGroup.Item>
                                    )}
                                </ListGroup>
                            )}
                        </Card.Body>
                    </Card>
                </div>

                <div className="col-md-6">
                    <Card className="mb-4">
                        <Card.Header className="d-flex justify-content-between align-items-center">
                            <h5>Kanji</h5>
                            <Button
                                variant="primary"
                                size="sm"
                                onClick={() => setShowKanjiModal(true)}
                            >
                                + Add Kanji
                            </Button>
                        </Card.Header>
                        <Card.Body>
                            {loading ? (
                                <div className="text-center">
                                    <Spinner animation="border" />
                                </div>
                            ) : (
                                <ListGroup variant="flush">
                                    {kanjiList.length > 0 ? (
                                        kanjiList.map((kanji, index) => (
                                            <ListGroup.Item key={index} className="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <div className="kanji-character display-6">{kanji.character}</div>
                                                    <div className="text-muted">{kanji.hiragana}</div>
                                                    <div className="text-muted">{kanji.meaning}</div>
                                                </div>
                                                <Button
                                                    variant="outline-danger"
                                                    size="sm"
                                                    onClick={() => handleDeleteClick(kanji, false)}
                                                    title="Delete kanji"
                                                >
                                                    <Trash size={16} />
                                                </Button>
                                            </ListGroup.Item>
                                        ))
                                    ) : (
                                        <ListGroup.Item>No kanji available</ListGroup.Item>
                                    )}
                                </ListGroup>
                            )}
                        </Card.Body>
                    </Card>
                </div>
            </div>

            

            {/* Add Vocabulary Modal */}
            <Modal show={showVocabModal} onHide={() => setShowVocabModal(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Add New Vocabulary</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <div className="mb-3">
                        <label className="form-label">Japanese Word</label>
                        <input
                            type="text"
                            className="form-control"
                            name="word"
                            value={newVocab.word}
                            onChange={handleVocabChange}
                            required
                        />
                    </div>
                   
                    <div className="mb-3">
                        <label className="form-label">Meaning</label>
                        <input
                            type="text"
                            className="form-control"
                            name="meaning"
                            value={newVocab.meaning}
                            onChange={handleVocabChange}
                            required
                        />
                    </div>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShowVocabModal(false)}>
                        Cancel
                    </Button>
                    <Button variant="primary" onClick={handleAddVocab}>
                        Add Vocabulary
                    </Button>
                </Modal.Footer>
            </Modal>

            {/* Add Kanji Modal */}
            <Modal show={showKanjiModal} onHide={() => setShowKanjiModal(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Add New Kanji</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <div className="mb-3">
                        <label className="form-label">Kanji Character</label>
                        <input
                            type="text"
                            className="form-control"
                            name="character"
                            value={newKanji.character}
                            onChange={handleKanjiChange}
                            required
                        />
                    </div>
                    <div className="mb-3">
                        <label className="form-label">Hiragana Reading</label>
                        <input
                            type="text"
                            className="form-control"
                            name="hiragana"
                            value={newKanji.hiragana}
                            onChange={handleKanjiChange}
                            required
                        />
                    </div>
                    <div className="mb-3">
                        <label className="form-label">Meaning</label>
                        <input
                            type="text"
                            className="form-control"
                            name="meaning"
                            value={newKanji.meaning}
                            onChange={handleKanjiChange}
                            required
                        />
                    </div>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShowKanjiModal(false)}>
                        Cancel
                    </Button>
                    <Button variant="primary" onClick={handleAddKanji}>
                        Add Kanji
                    </Button>
                </Modal.Footer>
            </Modal>

            {/* Delete Confirmation Modal */}
            <Modal show={showDeleteModal} onHide={() => setShowDeleteModal(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Confirm Deletion</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    Are you sure you want to delete this {isDeletingVocab ? 'vocabulary' : 'kanji'}:
                    <strong> {isDeletingVocab ? itemToDelete?.word : itemToDelete?.character}</strong>?
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShowDeleteModal(false)}>
                        Cancel
                    </Button>
                    <Button variant="danger" onClick={handleConfirmDelete}>
                        Delete
                    </Button>
                </Modal.Footer>
            </Modal>
        </div>
    );
};

export default LessonPage;