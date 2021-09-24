import React, { useState } from 'react'

import './small_screen_menu.scss'
import { Link } from 'react-router-dom'

const SmallScreenMenu = () => {
  const [isChecked, setIsChecked] = useState(false)

  const changeCheckState = () => {
    setIsChecked(prevIsChecked => !prevIsChecked)
  }

  return (
    <div className="head">
        <input type="checkbox" id="nav-toggle" className="nav-toggle" checked={isChecked} onChange={() => null}/>
        <nav >
          <ul onClick={changeCheckState}>
            <li><Link to="/">Home </Link> </li>
            <li><Link to="/">Nasze Koty </Link> </li>
            <li><Link to="/available_cats">Kocięta </Link> </li>
            <li><Link to="/">Informacje </Link> </li>
          </ul>
        </nav>
        <label onClick={changeCheckState} className="nav-toggle-label">
            <div className="bar"></div>
            <div className="bar"></div>
            <div className="bar"></div>
        </label>
    </div>
  )
}

export default SmallScreenMenu
