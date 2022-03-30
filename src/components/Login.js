import React from "react";

class Login extends React.Component {
  render() {
    return (
      <div>
        <h1>Se connecter</h1>
        <form action={`${process.env.REACT_APP_URL}/login.php`} method="post">
          <div>
            <label>Mail</label>
            <input type="text" name="email" placeholder="Name" />
            <label>Mot de passe</label>
            <input type="password" name="password" placeholder="Mot de passe" />
            <input type="submit" />
          </div>
        </form>
      </div>
    );
  }
}

export default Login;
