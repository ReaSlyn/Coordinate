import React from "react";
import {useNavigate} from "react-router-dom";
import styles from "./SearchBar.module.css";
import Filter from "./Filter";
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
            onChange={(e) => setSearchTerm(e.target.value.toLowerCase())}
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
        <Filter
          searchTerm={searchTerm}
          setFilter={setFilter}
          path="/feed"
          componentStyles={{
            borderRadius: "0 25px 25px 0",
            padding: "0 20px 0 6px",
            borderLeft: "none",
          }}
        />
      </form>
    </header>
  );
}

export default SearchBar;
