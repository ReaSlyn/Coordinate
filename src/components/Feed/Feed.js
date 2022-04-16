import React, {useEffect, useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import {Helmet} from "react-helmet";
import styles from "./Feed.module.css";
import view from "../../images/view.svg";
import like from "../../images/like.svg";

function Feed() {
  const [projects, setProjects] = useState([]);
  const [monthlyProjects, setMonthlyProjects] = useState([]);
  let navigate = useNavigate();

  useEffect(() => {
    let fetchMonthlyProjects = async () => {
      let res = await fetch(
        `${process.env.REACT_APP_URL}/fetchMonthlyProjectsFeed.php`,
        {
          method: "POST",
        }
      );

      let resJson = await res.json();
      setMonthlyProjects(resJson.projects);
    };

    let fetchProjects = async () => {
      let res = await fetch(
        `${process.env.REACT_APP_URL}/fetchProjectsFeed.php`,
        {
          method: "POST",
        }
      );

      let resJson = await res.json();
      setProjects(resJson.projects);
    };

    fetchMonthlyProjects();
    fetchProjects();
  }, []);

  return (
    <>
      <Helmet>
        <title>Coordinate | Flux de projets</title>
      </Helmet>
      <section className={styles.feed}>
        <div>
          <div className={styles.row}>
            <h2 className={styles.title}>Projet du mois</h2>
            <Link to="/monthly" className={styles.link}>
              voir tout
            </Link>
          </div>
          <div className={styles.projects}>
            {monthlyProjects.map((val, key) => (
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
            ))}
          </div>
        </div>
        <div>
          <h1 className={styles.title}>Tous les projets</h1>
          <div className={styles.projects}>
            {projects.map((val, key) => (
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
            ))}
          </div>
        </div>
      </section>
    </>
  );
}

export default Feed;
