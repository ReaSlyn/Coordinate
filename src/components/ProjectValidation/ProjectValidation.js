import React, {useEffect, useState} from "react";
import {Helmet} from "react-helmet";
import styles from "./ProjectValidation.module.css";

function ProjectValidation() {
  const [pendingProjects, setPendingProjects] = useState([]);

  useEffect(() => {
    let fetchPendingProjects = async () => {
      let res = await fetch(
        `${process.env.REACT_APP_URL}/fetchPendingProjects.php`,
        {
          method: "POST",
        }
      );

      let resJson = await res.json();
      setPendingProjects(resJson.projects);
    };

    fetchPendingProjects();
  }, []);

  function handleDecline(e, projectId) {
    e.currentTarget.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
    let deleteProject = async () => {
      let res = await fetch(`${process.env.REACT_APP_URL}/delete.php`, {
        method: "POST",
        body: JSON.stringify({
          projectId: projectId,
        }),
      });

      let resJson = await res.json();

      if (resJson.res) {
        alert("Le projet a bien été supprimé");
      } else {
        alert("Une erreur est survenue");
      }
    };

    deleteProject();
  }

  function handleAccept(e, projectId) {
    e.currentTarget.parentElement.parentElement.parentElement.parentElement.parentElement.remove();

    let acceptProject = async () => {
      let res = await fetch(`${process.env.REACT_APP_URL}/acceptProject.php`, {
        method: "POST",
        body: JSON.stringify({
          projectId: projectId,
        }),
      });

      let resJson = await res.json();

      if (resJson.res) {
        alert("Le projet a bien été accepté");
      } else {
        alert("Une erreur est survenue");
      }
    };

    acceptProject();
  }

  return (
    <>
      <Helmet>
        <title>Coordinate | Validation des projets</title>
      </Helmet>
      <section className={styles.projectValidation}>
        <h1>Validation des projets</h1>
        <div className={styles.projects}>
          {pendingProjects.map((val, key) => {
            return (
              <div key={key} className={styles.project}>
                {val.type.includes("image") ? (
                  <img src={val.url} alt={val.title} />
                ) : (
                  <video src={val.url} width="100%" height="100%" />
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
                      <div className={styles.buttons}>
                        <div
                          className={styles.decline}
                          onClick={(e) => handleDecline(e, val.project_id)}
                        >
                          <p>refuser</p>
                        </div>
                        <div
                          className={styles.accept}
                          onClick={(e) => {
                            handleAccept(e, val.project_id);
                          }}
                        >
                          <p>poster</p>
                        </div>
                      </div>
                    </div>
                    <div className="desc">
                      <p>{val.description}</p>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </section>
    </>
  );
}

export default ProjectValidation;
