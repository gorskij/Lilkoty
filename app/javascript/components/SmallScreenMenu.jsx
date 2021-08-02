import React from 'react'
import '../../assets/stylesheets/small_screen_menu.scss'
import { Link } from 'react-router-dom'

class Test extends React.Component {
  render () {
    return (
      <div className="head">
        <h1 className="logo">Logo</h1>
          <input type="checkbox" id="nav-toggle" className="nav-toggle" />
          <nav >
            <ul>
              <li><Link to="/">Home </Link> </li>
              <li><Link to="/">Nasze Koty </Link> </li>
              <li><Link to="/">Kocięta </Link> </li>
              <li><Link to="/">Informacje </Link> </li>
            </ul>
          </nav>
          <label htmlFor="nav-toggle" className="nav-toggle-label">
            <span></span>
          </label>
      </div>
    )
  }
}

export default Test
