import React, {useEffect, useState} from "react";
import {GoogleLogout} from "react-google-login";
import {Helmet} from "react-helmet";
import {useNavigate} from "react-router-dom";
import styles from "./Profile.module.css";
import profilePicture from "../../images/profilePicture.png";
import Filter from "../Layout/Filter";
import view from "../../images/view.svg";
import like from "../../images/like.svg";

function Profile(props) {
  const [user, setUser] = useState([]);
  const [projects, setProjects] = useState([]);
  const {setLoggedId, setFilter, filter} = props;
  let navigate = useNavigate();

  useEffect(() => {
    let fetchUserProject = async () => {
      let res = await fetch(
        `${process.env.REACT_APP_URL}/fetchUserProject.php`,
        {
          method: "POST",
          body: JSON.stringify({
            userId: localStorage.getItem("loggedId"),
          }),
        }
      );

      let resJson = await res.json();
      setUser(resJson.user[0]);
      setProjects(resJson.projects);
    };

    fetchUserProject();
  }, []);

  return (
    <>
      <Helmet>
        <title>Coordinate | Profil</title>
      </Helmet>
      <section className={styles.profile}>
        <div className={styles.wrapper}>
          <div className={styles.center}>
            <img src={profilePicture} alt="Photo de profile" />
            <div className={styles.info}>
              <div className={styles.text}>
                <h1>
                  {user.firstname} {user.lastname}
                </h1>
                <p>{user.role}, HETIC</p>
              </div>
              <div className={styles.row}>
                <div className={styles.contact}>
                  <p>{user.email}</p>
                </div>
                {user.phone_number ? (
                  <div className={styles.contact}>
                    <p>{user.phone_number.match(/.{1,2}/g).join(" ")}</p>
                  </div>
                ) : null}
              </div>
              <div
                className={styles.button}
                onClick={() => {
                  localStorage.removeItem("loggedId");
                  localStorage.removeItem("role");
                  setLoggedId(null);
                  navigate("/");
                }}
              >
                <GoogleLogout
                  clientId={process.env.REACT_APP_GOOGLE_CLIENT_ID}
                  onLogoutSuccess={() => {
                    localStorage.removeItem("loggedId");
                    localStorage.removeItem("role");
                    setLoggedId(null);
                    navigate("/");
                  }}
                  buttonText="Déconnexion"
                ></GoogleLogout>
              </div>
            </div>
          </div>
          <div className={styles.projects}>
            <div className={styles.bar}>
              <div className={styles.spaceBetween}>
                <h2>Projets</h2>
                <Filter
                  setFilter={setFilter}
                  path="/profile"
                  componentStyles={{
                    borderRadius: "25px",
                    padding: "0 20px",
                  }}
                />
              </div>
            </div>
            <div className={styles.projectsGrid}>
              {projects
                .filter((val) => {
                  if (!filter) {
                    return val;
                  } else if (val.primary_tag.includes(filter)) {
                    return val;
                  }
                })
                .map((item, key) => (
                  <div key={key} className={styles.project}>
                    {item.type.includes("image") ? (
                      <img
                        src={item.url}
                        alt={item.title}
                        onClick={() =>
                          navigate(`/project/${item.project_id}`, {
                            replace: true,
                          })
                        }
                      />
                    ) : (
                      <video
                        src={item.url}
                        width="100%"
                        height="100%"
                        onClick={() =>
                          navigate(`/project/${item.project_id}`, {
                            replace: true,
                          })
                        }
                      />
                    )}
                    <div className={styles.projectInfo}>
                      <div className={styles.spaceBetween}>
                        <p>{item.title}</p>
                        <div className={styles.impression}>
                          <div className={styles.iconText}>
                            <img src={view} alt="Views icon" />
                            <p>{item.views}</p>
                          </div>
                          <div className={styles.iconText}>
                            <img src={like} alt="Likes icon" />
                            <p>{item.likes}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                ))}
            </div>
          </div>
        </div>
      </section>
    </>
  );
}

export default Profile;
