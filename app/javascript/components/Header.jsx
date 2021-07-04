import React from "react";
import "../../assets/stylesheets/header.scss";
import "../../assets/stylesheets/application.scss";
import { Link } from "react-router-dom";

class Header extends React.Component {
  render() {
    return (
      <div className="header">
        <Link to="/" className="button">
          Home
        </Link>
        <div className="button">Nasze Koty</div>
        <Link to="/Litters" className="button">
          Kocięta
        </Link>
        <div className="button">Kontakt</div>
        <div className="button">Aktualnosci</div>
        <div className="button">Informacje</div>
        <div className="button">
          <div className="social-button">Facebook</div>
          <div className="social-button">Youtube</div>
        </div>
      </div>
    );
  }
}

export default Header;
