import React, {useEffect, useState} from "react";
import "./App.css";

function App() {
  const [message, setMessage] = useState({});

  useEffect(() => {
    fetch(`${process.env.REACT_APP_URL}`)
      .then((data) => data.json())
      .then((data) => setMessage(data));
  });

  return <h1 style={{textAlign: "center"}}>{message.message}</h1>;
}

export default App;
