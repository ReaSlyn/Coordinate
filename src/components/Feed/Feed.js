import React, {useState} from "react";
import {Link} from "react-router-dom";
import styles from "./Feed.module.css";
import view from "../../images/view.svg";
import like from "../../images/like.svg";
import JSONDATA from "./MOCK_DATA.json";

function Feed(props) {
  const {searchTerm, filter} = props;
  return (
    <section className={styles.feed}>
      <div>
        <div className={styles.row}>
          <h2 className={styles.title}>Projet du mois</h2>
          <Link to="/monthly" className={styles.link}>
            voir tout
          </Link>
        </div>
        <div className={styles.projects}>
          {JSONDATA.slice(0, 4)
            .filter((val) => {
              if (!searchTerm) {
                return val;
              } else if (val.title.toLowerCase().includes(searchTerm)) {
                return val;
              }
            })
            .map((val, key) => {
              return (
                <div key={key} className={styles.project}>
                  <img src={val.url} alt={val.title} />
                  <div className={styles.projectInfo}>
                    <div className={styles.spaceBetween}>
                      <p>{val.title}</p>
                      <div className={styles.impression}>
                        <div className={styles.iconText}>
                          <img src={view} alt="Views icon" />
                          <p>{val.views}</p>
                        </div>
                        <div className={styles.iconText}>
                          <img src={like} alt="Likes icon" />
                          <p>{val.likes}</p>
                        </div>
                      </div>
                    </div>
                    <p>
                      {val.firstname}&nbsp;{val.lastname}
                    </p>
                  </div>
                </div>
              );
            })}
        </div>
      </div>
      <div>
        <h1 className={styles.title}>Tout les projets</h1>
        <div className={styles.projects}>
          {JSONDATA.slice(4, JSONDATA.length)
            .filter((val) => {
              if (!searchTerm) {
                return val;
              } else if (val.title.toLowerCase().includes(searchTerm)) {
                return val;
              }
            })
            .map((val, key) => {
              return (
                <div key={key} className={styles.project}>
                  <img src={val.url} alt={val.title} />
                  <div className={styles.projectInfo}>
                    <div className={styles.spaceBetween}>
                      <p>{val.title}</p>
                      <div className={styles.impression}>
                        <div className={styles.iconText}>
                          <img src={view} alt="Views icon" />
                          <p>{val.views}</p>
                        </div>
                        <div className={styles.iconText}>
                          <img src={like} alt="Likes icon" />
                          <p>{val.likes}</p>
                        </div>
                      </div>
                    </div>
                    <p>
                      {val.firstname}&nbsp;{val.lastname}
                    </p>
                  </div>
                </div>
              );
            })}
        </div>
      </div>
    </section>
  );
}

export default Feed;
