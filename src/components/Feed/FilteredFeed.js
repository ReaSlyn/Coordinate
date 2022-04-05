import React, {useEffect, useState} from "react";
import {useParams, useNavigate} from "react-router-dom";
import {Helmet} from "react-helmet";
import styles from "./FilteredFeed.module.css";
import view from "../../images/view.svg";
import like from "../../images/like.svg";

function FilteredFeed(props) {
  const {urlSearchTerm} = useParams();
  const [projects, setProjects] = useState([]);
  const {filter} = props;
  let navigate = useNavigate();

  useEffect(() => {
    let fetchProjects = async () => {
      let res = await fetch(
        `${process.env.REACT_APP_URL}/fetchProjectsFeed.php`,
        {
          method: "POST",
          body: JSON.stringify({
            filter: filter,
            searchTerm: urlSearchTerm,
          }),
        }
      );

      let resJson = await res.json();
      setProjects(resJson.projects);
    };

    fetchProjects();
  }, [urlSearchTerm, filter]);

  return (
    <>
      <Helmet>
        <title>Coordinate | Flux de projets</title>
      </Helmet>
      <section className={styles.feed}>
        <div>
          <h1 className={styles.title}>Tout les projets {}</h1>
          <div className={styles.projects}>
            {projects.map((val, key) => {
              return (
                <div key={key} className={styles.project}>
                  {val.type.includes("image") ? (
                    <img
                      src={val.url}
                      alt={val.title}
                      onClick={() =>
                        navigate(`/project/${val.project_id}`, {replace: true})
                      }
                    />
                  ) : (
                    <video
                      src={val.url}
                      width="100%"
                      height="100%"
                      onClick={() =>
                        navigate(`/project/${val.project_id}`, {replace: true})
                      }
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
              );
            })}
          </div>
        </div>
      </section>
    </>
  );
}

export default FilteredFeed;
