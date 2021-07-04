import React from "react";
import "../../assets/stylesheets/header.scss";
import "../../assets/stylesheets/application.scss";
import { Link } from "react-router-dom";
import YtLogo from "../../assets/images/yt-logo.png";
import FbLogo from "../../assets/images/fb-logo.png";

class Header extends React.Component {
  render() {
    return (
      <div className="header">
        <Link to="/" className="button">
          Home
        </Link>
        <div className="button">Nasze Koty</div>
        <Link to="/available_cats" className="button">
          Dostępne Kocięta
        </Link>
        <Link to="/litters" className="button">
          Mioty
        </Link>
        <div className="button">Informacje</div>
        <div className="button">Aktualnosci</div>
        <div className="button">Kontakt</div>
        <div className="button">
          <a href="/litters">
            <img src={FbLogo}></img>
          </a>
          <a href="https://www.youtube.com/">
            <img src={YtLogo}></img>
          </a>
        </div>
      </div>
    );
  }
}

export default Header;
