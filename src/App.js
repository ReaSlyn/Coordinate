import React, {useEffect, useState} from "react";
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
import NewProject from "./components/NewProject/NewProject";
import MonthlyFeed from "./components/Feed/MonthlyFeed";
import FilteredFeed from "./components/Feed/FilteredFeed";
import ProjectValidation from "./components/ProjectValidation/ProjectValidation";
import Profile from "./components/Profile/Profile";
import Team from "./components/Team/Team";
import Project from "./components/Project/Project";

function App() {
  const [loggedId, setLoggedId] = useState(null);
  const [role, setRole] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [filter, setFilter] = useState("");

  useEffect(() => {
    if (localStorage.getItem("loggedId")) {
      setLoggedId(localStorage.getItem("loggedId"));
      setRole(localStorage.getItem("role"));
    }
  });

  return (
    <BrowserRouter>
      <Layout
        loggedId={loggedId}
        searchTerm={searchTerm}
        setSearchTerm={setSearchTerm}
        filter={filter}
        setFilter={setFilter}
        role={role}
      >
        <Routes>
          {!localStorage.getItem("loggedId") || !loggedId ? (
            <>
              <Route
                path="login"
                element={<Login setLoggedId={setLoggedId} setRole={setRole} />}
              />
              <Route
                path="register"
                element={
                  <Register setLoggedId={setLoggedId} setRole={setRole} />
                }
              />
              <Route path="*" element={<Navigate to="/login" replace />} />
            </>
          ) : (
            <>
              <Route path="/new-project" element={<NewProject />} />
              <Route
                path="/project-validation"
                element={<ProjectValidation />}
              />
              <Route
                path="/profile"
                element={
                  <Profile
                    setLoggedId={setLoggedId}
                    setFilter={setFilter}
                    filter={filter}
                    loggedId={loggedId}
                  />
                }
              />
              <Route
                path="/profile/design"
                element={
                  <Profile
                    setLoggedId={setLoggedId}
                    setFilter={setFilter}
                    filter={filter}
                    loggedId={loggedId}
                  />
                }
              />
              <Route
                path="/profile/development"
                element={
                  <Profile
                    setLoggedId={setLoggedId}
                    setFilter={setFilter}
                    filter={filter}
                    loggedId={loggedId}
                  />
                }
              />
              <Route
                path="/profile/management"
                element={
                  <Profile
                    setLoggedId={setLoggedId}
                    setFilter={setFilter}
                    filter={filter}
                    loggedId={loggedId}
                  />
                }
              />
              <Route path="/team" element={<Team />} />
              <Route path="/project/:projectId" element={<Project />} />
              <Route
                path="monthly"
                element={<MonthlyFeed filter={filter} setFilter={setFilter} />}
              />
              <Route
                path="monthly/design"
                element={<MonthlyFeed filter={filter} setFilter={setFilter} />}
              />
              <Route
                path="monthly/development"
                element={<MonthlyFeed filter={filter} setFilter={setFilter} />}
              />
              <Route
                path="monthly/management"
                element={<MonthlyFeed filter={filter} setFilter={setFilter} />}
              />
              <Route path="feed" element={<Feed />} />
              <Route
                path="feed/:urlSearchTerm"
                element={<FilteredFeed filter={filter} />}
              />
              <Route
                path="feed/design/:urlSearchTerm"
                element={<FilteredFeed filter={filter} />}
              />
              <Route
                path="feed/design"
                element={<FilteredFeed filter={filter} />}
              />
              <Route
                path="feed/development"
                element={<FilteredFeed filter={filter} />}
              />
              <Route
                path="feed/management"
                element={<FilteredFeed filter={filter} />}
              />
              <Route
                path="feed/development/:urlSearchTerm"
                element={<FilteredFeed filter={filter} />}
              />
              <Route
                path="feed/management/:urlSearchTerm"
                element={<FilteredFeed filter={filter} />}
              />

              <Route path="*" element={<Navigate to="feed" replace />} />
            </>
          )}
        </Routes>
      </Layout>
    </BrowserRouter>
  );
}

export default App;
