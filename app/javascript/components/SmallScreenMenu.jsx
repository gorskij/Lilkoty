import React from 'react'

import '../../assets/stylesheets/small_screen_menu.scss'
import { Link } from 'react-router-dom'

class Test extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      checked: false
    }
    this.changeState = this.changeState.bind(this)
  }

  changeState () {
    this.setState({
      checked: !this.state.checked
    })
  }

  render () {
    return (
      <div className="head">
          <input type="checkbox" id="nav-toggle" className="nav-toggle" checked={this.state.checked} onChange={() => null}/>
          <nav >
            <ul onClick={this.changeState}>
              <li><Link to="/">Home </Link> </li>
              <li><Link to="/">Nasze Koty </Link> </li>
              <li><Link to="/available_cats">Kocięta </Link> </li>
              <li><Link to="/">Informacje </Link> </li>
            </ul>
          </nav>
          <label onClick={this.changeState} className="nav-toggle-label">
              <div className="bar"></div>
              <div className="bar"></div>
              <div className="bar"></div>
          </label>
      </div>
    )
  }
}

export default Test
