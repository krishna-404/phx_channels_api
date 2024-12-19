import { useEffect, useRef, useState } from 'react';
import './App.css';

function App() {
  const socketRef = useRef<WebSocket | null>(null);
  const [message, setMessage] = useState("");
  const [events, setEvents] = useState<any[]>([]);

  useEffect(() => {
    // Create socket connection
    socketRef.current = new WebSocket("ws://localhost:4000/socket/websocket");

    // Set up event listeners
    socketRef.current.onopen = () => {
      setEvents(old => [...old, "Connection established"]);
      socketRef.current?.send(JSON.stringify({
        topic: "chat_room:lobby",
        event: "phx_join",
        payload: {},
        ref: "1"
      }));
    };

    socketRef.current.onmessage = (event) => {
      const message = JSON.parse(event.data);
      setEvents(old => [...old, message]);
      if (message.event === "new_msg") {
        setMessage(message.payload.body);
      }
    };

    // Cleanup on unmount
    return () => {
      socketRef.current?.close();
    };
  }, []);

  const sendMessage = () => {
    if (!message.trim()) return;
    
    socketRef.current?.send(JSON.stringify({
      topic: "chat_room:lobby",
      event: "send_msg",
      payload: { body: message, user: "user" },
      ref: Date.now().toString()
    }));
  };

  return (
    <div>
      <h1>Kayaan Chat</h1>
      <input 
        type="text" 
        value={message} 
        onChange={(e) => setMessage(e.target.value)} 
      />
      <button onClick={sendMessage}>Send</button>
      <ul>
        {events.map((event, index) => (
          <li key={index} style={{textAlign: 'left'}}>{JSON.stringify(event)}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
