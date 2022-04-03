import React, {useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import {Helmet} from "react-helmet";
import {GoogleLogin} from "react-google-login";
import styles from "./Login.module.css";
import hetic from "../../images/hetic.svg";
import logo from "../../images/logo.svg";

function Login(props) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const {setLogged, setToken} = props;
  let navigate = useNavigate();

  let handleSubmit = async (e) => {
    e.preventDefault();
    let res = await fetch(`${process.env.REACT_APP_URL}/login.php`, {
      method: "POST",
      body: JSON.stringify({
        email: email,
        password: password,
      }),
    });

    let resJson = await res.json();

    if (!resJson.emailCheck) {
      alert("Mail incorrect");
    } else if (!resJson.passwordCheck) {
      alert("Mot de passe incorrect");
      setPassword("");
    }
    if (resJson.passwordCheck) {
      localStorage.setItem("logged", resJson.passwordCheck);
      localStorage.setItem("email", resJson.email);
      setLogged(resJson.passwordCheck);
      setToken(resJson.email);
      navigate("/");
    }
  };

  function handleLogin(googleUser) {
    let profile = googleUser.getBasicProfile();
    localStorage.setItem("logged", profile.getId());
    localStorage.setItem("email", profile.getEmail());
    setLogged(profile.getId());
    setToken(profile.getEmail());
    navigate("/", {replace: true});
  }

  function handleFailure() {
    alert("Veuillez vous connecter avec votre mail hetic.net");
  }

  return (
    <>
      <Helmet>
        <title>Coordinate | Connexion</title>
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
                <div id={styles.active} className={styles.link}>
                  <h1>Se connecter</h1>
                </div>
              </Link>
              <Link to="/register">
                <div className={styles.link}>
                  <h2>S'inscrire</h2>
                </div>
              </Link>
            </div>
            <form onSubmit={handleSubmit} className={styles.form}>
              <div className={styles.input}>
                <label>Mail</label>
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                />
              </div>
              <div className={styles.input}>
                <label>Mot de passe</label>
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>
              <input type="submit" value="connexion" />
            </form>
            <p className={styles.other}>ou connecte toi avec</p>
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

export default Login;
