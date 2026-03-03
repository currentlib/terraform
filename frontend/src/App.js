import React, { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState("Loading...");

  useEffect(() => {
    // In a real app, this URL would point to your Azure Backend URL
    fetch('/api/data')
      .then(res => res.json())
      .then(data => setMessage(data.message))
      .catch(() => setMessage("Backend not reachable yet"));
  }, []);

  return (
    <div style={{ textAlign: 'center', marginTop: '50px' }}>
      <h1>My Azure Research Project</h1>
      <p>Backend says: <strong>{message}</strong></p>
    </div>
  );
}

export default App;