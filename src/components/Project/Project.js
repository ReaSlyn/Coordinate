import React, {useEffect, useState} from "react";
import {useNavigate, useParams} from "react-router-dom";
import {Helmet} from "react-helmet";
import styles from "./Project.module.css";
import close from "../../images/closeProject.svg";
import profilePicture from "../../images/profilePicture.png";

function Profile() {
  const {projectId} = useParams();
  const [project, setProject] = useState([]);
  const [url, setUrl] = useState([]);
  const [type, setType] = useState([]);
  let navigate = useNavigate();

  useEffect(() => {
    let fetchProject = async () => {
      let res = await fetch(`${process.env.REACT_APP_URL}/fetchProject.php`, {
        method: "POST",
        body: JSON.stringify({
          projectId: projectId,
        }),
      });

      let resJson = await res.json();
      setProject(resJson.projects[0]);
      let urls = [];
      let types = [];
      resJson.projects.map((project) => {
        urls.push(project.url);
        types.push(project.type);
      });
      setUrl(urls);
      setType(types);
    };

    fetchProject();
  }, []);
  return (
    <>
      <Helmet>
        <title>Coordinate | Projet</title>
      </Helmet>
      <section className={styles.project}>
        <div className={styles.wrapper}>
          <div className={styles.spaceBetween}>
            <div className={styles.profile}>
              <img src={profilePicture} alt="Photo de profil" />
              <div className={styles.profileName}>
                <h1>{project.title}</h1>
                <p>
                  {project.firstname} {project.lastname}
                </p>
              </div>
            </div>
            <img
              src={close}
              alt="Fermer le projet"
              onClick={() => navigate(-1)}
            />
          </div>
          <div className={styles.projectContent}>
            {url.map((item, index) =>
              type[index] === "image" ? (
                <img src={item} alt={project.title} />
              ) : (
                <video src={item} width="100%" height="100%" autoPlay />
              )
            )}
          </div>
          <p className={styles.description}>{project.description}</p>
        </div>
      </section>
    </>
  );
}

export default Profile;
