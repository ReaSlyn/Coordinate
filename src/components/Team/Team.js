import React from "react";
import {Helmet} from "react-helmet";
import styles from "./Team.module.css";
import thanh from "../../images/thanh.png";
import antoine from "../../images/antoine.png";
import noe from "../../images/noe.png";
import joakim from "../../images/joakim.png";

function Team() {
  return (
    <>
      <Helmet>
        <title>Coordinate | L'équipe</title>
      </Helmet>
      <section className={styles.team}>
        <h1>L'équipe</h1>
        <div className={styles.row}>
          <div className={styles.person}>
            <img src={thanh} alt="Photo de Thanh-Long" />
            <p>Thanh-Long PHAM</p>
            <p>Développeur</p>
          </div>
          <div className={styles.person}>
            <img src={antoine} alt="Photo d'Antoine" />
            <p>Antoine SCHIRR</p>
            <p>Chef de projet</p>
          </div>
          <div className={styles.person}>
            <img src={noe} alt="Photo de Noé" />
            <p>Noé Meunier</p>
            <p>Designer</p>
          </div>
          <div className={styles.person}>
            <img src={joakim} alt="Photo de Joakim" />
            <p>Joakim DOMNGANG</p>
            <p>Développeur</p>
          </div>
        </div>
      </section>
    </>
  );
}

export default Team;
