import React, {useEffect, useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import {Helmet} from "react-helmet";
import styles from "./MonthlyFeed.module.css";
import banner from "../../images/monthlyBanner.png";
import Filter from "../Layout/Filter";
import view from "../../images/view.svg";
import like from "../../images/like.svg";

function MonthlyFeed(props) {
  const {searchTerm, filter, setFilter} = props;
  const [monthlyProjects, setMonthlyProjects] = useState([]);
  let navigate = useNavigate();

  useEffect(() => {
    const imageSample = document.querySelector(".image");
    const desc = document.querySelectorAll(".desc");
    function descResize() {
      desc.forEach((element) => {
        element.style.maxHeight = imageSample.offsetHeight - 122 + "px";
      });
    }

    let fetchMonthlyProjects = async () => {
      let res = await fetch(
        `${process.env.REACT_APP_URL}/fetchMonthlyProjectsFeed.php`,
        {
          method: "POST",
          body: JSON.stringify({
            filter: filter,
          }),
        }
      );

      let resJson = await res.json();
      setMonthlyProjects(resJson.projects);
    };

    fetchMonthlyProjects();
    descResize();
    window.addEventListener("resize", descResize);
  }, []);

  return (
    <>
      <Helmet>
        <title>Coordinate | Projets du mois</title>
      </Helmet>
      <section className={styles.monthlyFeed}>
        <div className={styles.banner}>
          <img src={banner} alt="monthly banner" />
          <div className={styles.innerBanner}>
            <h1>“Projets du mois”</h1>
            <Filter
              setFilter={setFilter}
              path="/monthly"
              componentStyles={{
                borderRadius: "25px",
                padding: "0 20px",
              }}
            />
          </div>
        </div>
        <div className={styles.projects}>
          {monthlyProjects
            .filter((val) => {
              if (!filter) {
                return val;
              } else if (val.primary_tag.includes(filter)) {
                return val;
              }
            })
            .map((val, key) => {
              return (
                <div key={key} className={styles.project}>
                  {val.type.includes("image") ? (
                    <img
                      src={val.url}
                      alt={val.title}
                      onClick={() => navigate(`/project/${val.project_id}`)}
                    />
                  ) : (
                    <video
                      src={val.url}
                      width="100%"
                      height="100%"
                      onClick={() => navigate(`/project/${val.project_id}`)}
                    />
                  )}
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
    </>
  );
}

export default MonthlyFeed;
