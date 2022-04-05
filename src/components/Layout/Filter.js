import React from "react";
import {NavLink} from "react-router-dom";
import styles from "./Filter.module.css";

function Filter(props) {
  const {searchTerm, setFilter, componentStyles} = props;

  return (
    <div className={styles.filter} style={componentStyles}>
      <NavLink
        to={`${props.path ? props.path : ""}/${searchTerm ? searchTerm : ""}`}
        onClick={() => setFilter("")}
      >
        <div className={styles.button}>
          <p>tout</p>
        </div>
      </NavLink>
      <NavLink
        to={`${props.path ? props.path : ""}/design/${
          searchTerm ? searchTerm : ""
        }`}
        onClick={() => setFilter(`design`)}
      >
        <div className={styles.button}>
          <p>design</p>
        </div>
      </NavLink>
      <NavLink
        to={`${props.path ? props.path : ""}/development/${
          searchTerm ? searchTerm : ""
        }`}
        onClick={() => setFilter(`development`)}
      >
        <div className={styles.button}>
          <p>développement</p>
        </div>
      </NavLink>
      <NavLink
        to={`${props.path ? props.path : ""}/management/${
          searchTerm ? searchTerm : ""
        }`}
        onClick={() => setFilter(`management`)}
      >
        <div className={styles.button}>
          <p>chef de projet</p>
        </div>
      </NavLink>
    </div>
  );
}

export default Filter;
