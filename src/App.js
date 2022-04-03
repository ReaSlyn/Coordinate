import React, {useState} from "react";
import {BrowserRouter, Routes, Route, Navigate} from "react-router-dom";
import "./App.css";
import "./fonts/NeueHaasDisplayThin.ttf";
import "./fonts/NeueHaasDisplayRoman.ttf";
import "./fonts/NeueHaasDisplayMedium.ttf";
import "./fonts/NeueHaasDisplayBold.ttf";
import Login from "./components/Login/Login";
import Register from "./components/Register/Register";
import Layout from "./components/Layout/Layout";
import Feed from "./components/Feed/Feed";
import FilteredFeed from "./components/Feed/FilteredFeed";

function App() {
  const [logged, setLogged] = useState(false);
  const [email, setToken] = useState("");
  const [searchTerm, setSearchTerm] = useState("");
  const [filter, setFilter] = useState("");

  return (
    <BrowserRouter>
      <Layout
        logged={logged}
        searchTerm={searchTerm}
        setSearchTerm={setSearchTerm}
        filter={filter}
        setFilter={setFilter}
      >
        <Routes>
          {!logged && !localStorage.getItem("logged") ? (
            <>
              <Route
                path="/login"
                element={<Login setLogged={setLogged} setToken={setToken} />}
              />
              <Route
                path="/register"
                element={<Register setLogged={setLogged} setToken={setToken} />}
              />
              <Route path="*" element={<Navigate to="/login" replace />} />
            </>
          ) : (
            <>
              <Route path="/" element={<Feed />} />
              <Route
                path="/feed"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="feed/:urlFilter"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="feed/design/:urlFilter"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="feed/development/:urlFilter"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="feed/project-manager/:urlFilter"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />

              <Route path="*" element={<Navigate to="/" replace />} />
            </>
          )}
        </Routes>
      </Layout>
    </BrowserRouter>
  );
}

export default App;
