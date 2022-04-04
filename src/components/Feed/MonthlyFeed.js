import React, {useEffect, useState} from "react";
import {useParams, Link} from "react-router-dom";
import styles from "./MonthlyFeed.module.css";
import banner from "../../images/monthlyBanner.png";
import Filter from "../Layout/Filter";
import view from "../../images/view.svg";
import like from "../../images/like.svg";

import JSONDATA from "./MOCK_DATA.json";

function FilteredFeed(props) {
  const {searchTerm, filter} = props;
  const {urlFilter} = useParams();

  useEffect(() => {
    const imageSample = document.querySelector(".image");
    const desc = document.querySelectorAll(".desc");
    function descResize() {
      desc.forEach((element) => {
        element.style.maxHeight = imageSample.offsetHeight - 122 + "px";
      });
    }

    descResize();
    window.addEventListener("resize", descResize);
  }, []);

  return (
    <section className={styles.monthlyFeed}>
      <div className={styles.banner}>
        <img src={banner} alt="monthly banner" />
        <div className={styles.innerBanner}>
          <h1>“Projet du mois”</h1>
          <Filter
            searchTerm={searchTerm}
            filter={filter}
            path="/monthly"
            componentStyles={{
              borderRadius: "25px",
              padding: "0 20px",
            }}
            className={styles.filter5}
          />
        </div>
      </div>
      <div className={styles.projects}>
        {JSONDATA.slice(0, JSONDATA.length)
          .filter((val) => {
            if (!urlFilter) {
              return val;
            } else if (val.title.toLowerCase() /* .includes(urlFilter) */) {
              return val;
            }
          })
          .map((val, key) => {
            return (
              <div key={key} className={styles.project}>
                <img className="image" src={val.url} alt={val.title} />
                <div className={styles.projectInfo}>
                  <div className={styles.more}>
                    <div className={styles.spaceBetween}>
                      <div className={styles.info}>
                        <p>{val.title}</p>
                        <p>
                          {val.firstname}&nbsp;{val.lastname}
                        </p>
                      </div>
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
                    <div className="desc">
                      <p>{val.description}</p>
                    </div>
                  </div>
                  <div className={styles.right}>
                    <Link to="/profil/">
                      <div className={styles.button}>
                        <p>voir profil</p>
                      </div>
                    </Link>
                  </div>
                  <div className={styles.fadeTop}></div>
                  <div className={styles.fadeBottom}></div>
                </div>
              </div>
            );
          })}
      </div>
    </section>
  );
}

export default FilteredFeed;
