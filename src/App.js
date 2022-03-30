import React, {useEffect, useState} from "react";
import {BrowserRouter, Routes, Route} from "react-router-dom";
import "./App.css";
import Login from "./components/Login";

function App() {
  const [data, setData] = useState({});

  useEffect(() => {
    fetch(`${process.env.REACT_APP_URL}/login.php`)
      .then((innerData) => innerData.json())
      .then((innerData) => setData(innerData))
      .catch((error) => console.log(error));
  });

  console.log(data);

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
