import React, {useEffect, useState} from "react";
import {useNavigate, Link, NavLink} from "react-router-dom";
import styles from "./SearchBar.module.css";
import search from "../../images/search.svg";
import close from "../../images/close.svg";

function SearchBar(props) {
  const {searchTerm, setSearchTerm, filter, setFilter} = props;
  const navigate = useNavigate();

  function handleSubmit(e = null) {
    if (e) {
      e.preventDefault();
    }
    if (filter) {
      navigate(`feed/${filter}/${searchTerm}`);
    } else {
      navigate(`feed/${searchTerm}`);
    }
  }

  return (
    <header className={styles.header}>
      <form onSubmit={handleSubmit} className={styles.form}>
        <div className={styles.searchBar}>
          <input
            type="text"
            placeholder="chercher un projet"
            value={searchTerm}
            onChange={(e) =>
              setSearchTerm(
                e.target.value.toLowerCase().replace(/[^a-zA-Z ]/g, "")
              )
            }
          />
          <img
            className={styles.search}
            src={search}
            alt="search"
            onClick={(e) => handleSubmit(e)}
          />
          <img
            className={styles.close}
            src={close}
            alt="close"
            onClick={(e) => {
              setSearchTerm("");
              if (filter) {
                navigate(`/feed/${filter}`);
              } else {
                navigate("/feed/");
              }
            }}
          />
        </div>
        <div className={styles.filter}>
          <NavLink
            to={`feed/${searchTerm ? searchTerm : ""}`}
            onClick={() => setFilter("")}
          >
            <div className={styles.button}>
              <p>tout</p>
            </div>
          </NavLink>
          <NavLink
            to={`feed/design/${searchTerm ? searchTerm : ""}`}
            onClick={() => setFilter(`design`)}
          >
            <div className={styles.button}>
              <p>design</p>
            </div>
          </NavLink>
          <NavLink
            to={`feed/development/${searchTerm ? searchTerm : ""}`}
            onClick={() => setFilter(`development`)}
          >
            <div className={styles.button}>
              <p>développement</p>
            </div>
          </NavLink>
          <NavLink
            to={`feed/project-manager/${searchTerm ? searchTerm : ""}`}
            onClick={() => setFilter(`project-manager`)}
          >
            <div className={styles.button}>
              <p>chef de projet</p>
            </div>
          </NavLink>
        </div>
      </form>
    </header>
  );
}

export default SearchBar;
