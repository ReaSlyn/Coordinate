import React, {useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import {Helmet} from "react-helmet";
import {GoogleLogin} from "react-google-login";
import styles from "./Register.module.css";
import hetic from "../../images/hetic.svg";
import logo from "../../images/logo.svg";

function Register(props) {
  const [password, setPassword] = useState("");
  const {
    setLoggedId,
    setRole,
    setFirstName,
    setLastName,
    firstName,
    lastName,
    email,
    setEmail,
  } = props;
  let navigate = useNavigate();

  let handleSubmit = async (e) => {
    e.preventDefault();
    let res = await fetch(`${process.env.REACT_APP_URL}/register.php`, {
      method: "POST",
      body: JSON.stringify({
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      }),
    });

    let resJson = await res.json();

    if (resJson.loggedId) {
      localStorage.setItem("loggedId", resJson.loggedId);
      localStorage.setItem("role", resJson.role);
      setLoggedId(resJson.loggedId);
      setRole(resJson.role);
      navigate("/", {replace: true});
    } else {
      alert("Le mail est déjà utilisé");
    }
  };

  function handleLogin(googleUser) {
    let profile = googleUser.getBasicProfile();

    let handleGoogleLogin = async (e) => {
      let res = await fetch(`${process.env.REACT_APP_URL}/register.php`, {
        method: "POST",
        body: JSON.stringify({
          email: profile.getEmail(),
          password: profile.getId(),
          firstName: profile.getGivenName(),
          lastName: profile.getFamilyName(),
        }),
      });

      let resJson = await res.json();
      if (resJson.loggedId) {
        localStorage.setItem("loggedId", resJson.loggedId);
        localStorage.setItem("role", resJson.role);
        setLoggedId(resJson.loggedId);
        setRole(resJson.role);
        navigate("/", {replace: true});
      } else {
        alert("Le mail est déjà utilisé");
      }
    };

    handleGoogleLogin();
  }

  function handleFailure() {
    alert("Veuillez vous connecter avec votre mail hetic.net");
  }

  return (
    <>
      <Helmet>
        <title>Coordinate | Inscription</title>
      </Helmet>
      <div className={styles.background}>
        <div className={styles.card}>
          <div className={styles.cardBody}>
            <div className={styles.logo}>
              <img src={hetic} alt="Logo hetic" />
              <img
                className={styles.coordinate}
                src={logo}
                alt="Logo coordinate"
              />
            </div>
            <div className={styles.header}>
              <Link to="/login">
                <div className={styles.link}>
                  <h2>Se connecter</h2>
                </div>
              </Link>
              <Link to="/register">
                <div id={styles.active} className={styles.link}>
                  <h1>S'inscrire</h1>
                </div>
              </Link>
            </div>
            <form onSubmit={handleSubmit} className={styles.form}>
              <div className={styles.double}>
                <div className={styles.input}>
                  <label>Prénom</label>
                  <input
                    type="text"
                    name={firstName}
                    onChange={(e) => setFirstName(e.target.value)}
                    required
                  />
                </div>
                <div className={styles.input}>
                  <label>Nom</label>
                  <input
                    type="text"
                    name={lastName}
                    onChange={(e) => setLastName(e.target.value)}
                    required
                  />
                </div>
              </div>
              <div className={styles.input}>
                <label>Mail</label>
                <input
                  type="email"
                  name={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                />
              </div>
              <div className={styles.input}>
                <label>Mot de passe</label>
                <input
                  type="password"
                  name={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>
              <label className={styles.row}>
                <input type="checkbox" required />
                J’accepte les &nbsp;<span>Termes & Conditions</span>
              </label>
              <input type="submit" value="inscription" />
            </form>
            <p className={styles.other}>ou inscrit toi avec</p>
            <GoogleLogin
              clientId={process.env.REACT_APP_GOOGLE_CLIENT_ID}
              onSuccess={handleLogin}
              onFailure={handleFailure}
              cookiePolicy={"single_host_origin"}
              isSignedIn={true}
              buttonText="Continuer avec Google"
            ></GoogleLogin>
          </div>
        </div>
      </div>
    </>
  );
}

export default Register;
