import React, { useState, useEffect } from 'react';
import MainLessonPage from './MainLessonPage';

const ContainerApp = ({ children }) => {
    const [selectedLevel, setSelectedLevel] = useState(null);
    const [levels, setLevels] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const [newLevelName, setNewLevelName] = useState('');
    const [showModal, setShowModal] = useState(false);

    // Fetch levels function
    const fetchLevels = async () => {
        try {
            const response = await fetch('http://localhost:7070/level/show-all');
            if (!response.ok) throw new Error('Failed to fetch levels');
            const data = await response.json();
            setLevels(data);
        } catch (err) {
            setError(err.message || 'Failed to load levels');
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchLevels();
    }, []);

    const handleCreateLevel = async () => {
        if (!newLevelName) return;

        try {
            const response = await fetch('https://localhost:7070/level/new-level', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name: newLevelName }),
            });

            if (!response.ok) throw new Error('Failed to create new level');
            const data = await response.json();
            alert('New level created successfully!');
            setNewLevelName('');
            setShowModal(false);
            fetchLevels(); // Refresh the level list
        } catch (err) {
            setError(err.message || 'Failed to create new level');
        }
    };

    return (
        <div className="container-app" style={{ backgroundColor: '#f0f8ff', minHeight: '100vh', padding: '20px' }}>
            {selectedLevel ? (
                <>
                    <button
                        style={{
                            padding: '10px 20px',
                            fontSize: '16px',
                            backgroundColor: '#FF5733',
                            color: '#fff',
                            border: 'none',
                            borderRadius: '5px',
                            cursor: 'pointer',
                            marginBottom: '20px',
                            position: 'absolute',
                            top: '20px',
                            left: '20px',
                            width: '150px',
                        }}
                        onClick={() => setSelectedLevel(null)}
                    >
                        Home
                    </button>
                    <MainLessonPage level={selectedLevel} />
                </>
            ) : (
                <>
                    {children}
                    <div style={{ textAlign: 'center', fontFamily: 'Arial, sans-serif', color: '#333' }}>
                        <p style={{ fontSize: '24px', fontWeight: 'bold', marginBottom: '10px' }}>
                            Welcome to Japanese Vocabulary Learning App!
                        </p>
                        <p style={{ fontSize: '18px', marginBottom: '20px' }}>Choose your level:</p>
                        
                        {loading ? (
                            <div>Loading levels...</div>
                        ) : error ? (
                            <div style={{ color: 'red' }}>{error}</div>
                        ) : (
                            <div style={{ display: 'flex', justifyContent: 'center', gap: '10px', marginTop: '20px' }}>
                                {levels.map((level) => (
                                    <button
                                        key={level.id}
                                        style={{
                                            padding: '12px 30px',
                                            fontSize: '20px',
                                            backgroundColor: '#007BFF',
                                            color: '#fff',
                                            border: 'none',
                                            borderRadius: '5px',
                                            cursor: 'pointer',
                                            transition: 'background-color 0.3s ease',
                                            marginRight: '10px',
                                        }}
                                        onClick={() => setSelectedLevel(level.name)}
                                        onMouseOver={(e) => (e.target.style.backgroundColor = '#0056b3')}
                                        onMouseOut={(e) => (e.target.style.backgroundColor = '#007BFF')}
                                    >
                                        {level.name}
                                    </button>
                                ))}
                            </div>
                        )}

                        <button
                            style={{
                                padding: '12px 30px',
                                fontSize: '20px',
                                backgroundColor: '#28a745',
                                color: '#fff',
                                border: 'none',
                                borderRadius: '5px',
                                cursor: 'pointer',
                                marginTop: '20px',
                            }}
                            onClick={() => setShowModal(true)}
                        >
                            Create Level
                        </button>

                        {showModal && (
                            <div
                                style={{
                                    position: 'fixed',
                                    top: '50%',
                                    left: '50%',
                                    transform: 'translate(-50%, -50%)',
                                    backgroundColor: '#fff',
                                    padding: '20px',
                                    borderRadius: '10px',
                                    boxShadow: '0px 4px 6px rgba(0, 0, 0, 0.1)',
                                    width: '300px',
                                }}
                            >
                                <h3>Create New Level</h3>
                                <input
                                    type="text"
                                    placeholder="Level Name"
                                    value={newLevelName}
                                    onChange={(e) => setNewLevelName(e.target.value)}
                                    style={{
                                        padding: '10px',
                                        width: '100%',
                                        marginBottom: '10px',
                                        borderRadius: '5px',
                                        border: '1px solid #ccc',
                                    }}
                                />
                                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                                    <button
                                        onClick={() => setShowModal(false)}
                                        style={{
                                            padding: '8px 16px',
                                            backgroundColor: '#6c757d',
                                            color: '#fff',
                                            border: 'none',
                                            borderRadius: '5px',
                                            cursor: 'pointer',
                                        }}
                                    >
                                        Cancel
                                    </button>
                                    <button
                                        onClick={handleCreateLevel}
                                        style={{
                                            padding: '8px 16px',
                                            backgroundColor: '#007BFF',
                                            color: '#fff',
                                            border: 'none',
                                            borderRadius: '5px',
                                            cursor: 'pointer',
                                        }}
                                    >
                                        Create
                                    </button>
                                </div>
                            </div>
                        )}
                    </div>
                </>
            )}
        </div>
    );
};

export default ContainerApp;
