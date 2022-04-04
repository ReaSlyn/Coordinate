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
import NewProject from "./components/NewProject/NewProject";
import MonthlyFeed from "./components/Feed/MonthlyFeed";
import FilteredFeed from "./components/Feed/FilteredFeed";
import ProjectValidation from "./components/ProjectValidation/ProjectValidation";
import Profile from "./components/Profil/Profile";

function App() {
  const [loggedId, setLoggedId] = useState(null);
  const [role, setRole] = useState(null);
  const [firstName, setFirstName] = useState(null);
  const [lastName, setLastName] = useState(null);
  const [email, setEmail] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [filter, setFilter] = useState("");

  console.log(localStorage);

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
          {!localStorage.getItem("loggedId") ? (
            <>
              <Route
                path="login"
                element={
                  <Login
                    setLoggedId={setLoggedId}
                    setRole={setRole}
                    setFirstName={setFirstName}
                    setLastName={setLastName}
                    setEmail={setEmail}
                    email={email}
                  />
                }
              />
              <Route
                path="register"
                element={
                  <Register
                    setLoggedId={setLoggedId}
                    setRole={setRole}
                    setFirstName={setFirstName}
                    setLastName={setLastName}
                    firstName={firstName}
                    lastName={lastName}
                    setEmail={setEmail}
                    email={email}
                  />
                }
              />
              <Route path="*" element={<Navigate to="/login" replace />} />
            </>
          ) : (
            <>
              <Route
                path="/new-project"
                element={<NewProject />}
              />
              <Route
                path="/project-validation"
                element={<ProjectValidation />}
              />
              <Route path="/profile" element={<Profile />} />
              <Route
                path="monthly"
                element={
                  <MonthlyFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="monthly/:urlFilter"
                element={
                  <MonthlyFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route path="feed" element={<Feed />} />
              <Route
                path="feed/:urlFilter"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="feed/design/:urlSearchTerm"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="feed/development/:urlSearchTerm"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
              />
              <Route
                path="feed/project-manager/:urlSearchTerm"
                element={
                  <FilteredFeed searchTerm={searchTerm} filter={filter} />
                }
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
