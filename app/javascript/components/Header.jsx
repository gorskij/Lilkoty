import React from 'react'
import '../../assets/stylesheets/header.scss'
import '../../assets/stylesheets/application.scss'
import { Link } from 'react-router-dom'
import YtLogo from '../../assets/images/yt-logo.png'
import FbLogo from '../../assets/images/fb-logo.png'
import { AiOutlineHome } from 'react-icons/ai'
class Header extends React.Component {
  render () {
    return (
      <div className="header">
        <div className="nav-buttons">
            <Link to="/" className="button">
              <AiOutlineHome />
            </Link>
          <div className="button">Nasze&nbsp;Koty</div>
          <Link to="/available_cats" className="button">
            Kocięta
          </Link>
          <div className="button">
            <div className="dropdown">
              <div className="dropdown-button">
                Informacje
                <div className="arrow-down"></div>
              </div>
              <div className="dropdown-content">
                <a href="/litters">O Nas</a>
                <a href="/litters">Poradnik</a>
                <a href="/litters">Aktualności</a>
                <a href="/litters">Kontakt</a>
                <a href="/litters">Mioty</a>
              </div>
            </div>
          </div>
        </div>
        <div className="social-buttons">
          <div className="button">
            <a href="/litters">
              <img src={FbLogo}></img>
            </a>
            <a href="https://www.youtube.com/">
              <img src={YtLogo}></img>
            </a>
          </div>
        </div>

      </div>
    )
  }
}

export default Header
