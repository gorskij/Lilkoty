import React, { useState } from 'react'
import './header.scss'
import '../../../../assets/stylesheets/application.scss'
import { Link } from 'react-router-dom'
import YtLogo from '../../../../assets/images/yt-logo.png'
import FbLogo from '../../../../assets/images/fb-logo.png'
import { AiOutlineHome } from 'react-icons/ai'
const Header = () => {
  const [currentTab, setCurrentTab] = useState(0)

  const setActiveTab = (tabId) => {
    setCurrentTab(tabId)
  }

  return (
    <div className="header">
      <div className="nav-buttons">
        <Link to="/" className="button" onClick={(tabId) => setActiveTab(0)}>
          <AiOutlineHome />
        </Link>
        <Link to="/breeding_cats" className={currentTab === 1 ? 'button active' : 'button'} onClick={(tabId) => setActiveTab(1)}>Nasze&nbsp;Koty</Link>
        <Link to="/available_cats" className={currentTab === 2 ? 'button active' : 'button'} onClick={(tabId) => setActiveTab(2)}>
          Kocięta
        </Link>
        <div className="button">
          <div className="dropdown">
            <div className="dropdown-button">
              Informacje
              <div className="arrow-down"></div>
            </div>
            <div className="dropdown-box">
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
      </div>
      <div className="social-buttons">
        <a href="https://www.facebook.com/Bia%C5%82e-%C5%81apki-PL-106396461763675/?ref=page_internal">
          <img src={FbLogo}></img>
        </a>
        <a href="https://www.youtube.com/">
          <img src={YtLogo}></img>
        </a>
      </div>

    </div>
  )
}

export default Header
