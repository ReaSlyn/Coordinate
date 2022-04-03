import React from "react";
import {Link} from "react-router-dom";
import styles from "./Navbar.module.css";
import hetic from "../../images/hetic.svg";
import logo from "../../images/logo.svg";
import profilePicture from "../../images/profilePicture.png";

function Navbar(props) {
  return (
    <nav className={styles.navbar}>
      <ul>
        <li>
          <Link to="/">
            <div className={styles.logo}>
              <img src={hetic} alt="Logo hetic" />
              <img
                className={styles.coordinate}
                src={logo}
                alt="Logo coordinate"
              />
            </div>
          </Link>
        </li>
        <li className={styles.right}>
          <Link to="/new-project">
            <div className={styles.button}>
              <p>validation des projets</p>
            </div>
          </Link>
          <Link to="/project-validation">
            <div className={styles.button}>
              <p>nouveau projet</p>
            </div>
          </Link>
          <Link to="/profile">
            <img
              className={styles.profilePicture}
              src={profilePicture}
              alt="Profil"
            />
          </Link>
        </li>
      </ul>
    </nav>
  );
}

export default Navbar;
