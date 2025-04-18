import React, { useState, useEffect } from 'react';
import MainLessonPage from './MainLessonPage';

const ContainerApp = ({ children }) => {
    const [selectedLevel, setSelectedLevel] = useState(null);
    const [levels, setLevels] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');

    useEffect(() => {
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

        fetchLevels();
    }, []);

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
                        }}
                        onClick={() => setSelectedLevel(null)}
                    >
                        Back
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
                    </div>
                </>
            )}
        </div>
    );
};

export default ContainerApp;