import React from 'react'
import '../../assets/stylesheets/header.scss'
import '../../assets/stylesheets/application.scss'
import { Link } from 'react-router-dom'
import YtLogo from '../../assets/images/yt-logo.png'
import FbLogo from '../../assets/images/fb-logo.png'
import { AiOutlineHome } from 'react-icons/ai'
class Header extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      tab: { tab_id: '0' },
      tab_id: '0'
    }
    this.handleClick = this.handleClick.bind(this)
    this.changeStateToHome = this.changeStateToHome.bind(this)
    this.changeStateToNaszeKoty = this.changeStateToNaszeKoty.bind(this)
    this.changeStateToKocieta = this.changeStateToKocieta.bind(this)
  }

  handleClick () {
    console.log(this.state.tab_id)
  }

  changeStateToHome () {
    this.setState({
      tab_id: '0'
    })
  }

  changeStateToNaszeKoty () {
    this.setState({
      tab_id: '1'
    })
  }

  changeStateToKocieta () {
    this.setState({
      tab_id: '2'
    })
  }

  render () {
    return (
      <div className="header">
        <div className="nav-buttons">
          <Link to="/" className="button" onClick={this.changeStateToHome}>
            <AiOutlineHome />
          </Link>
          <div className={this.state.tab_id === '1' ? 'button active' : 'button'} onClick={this.changeStateToNaszeKoty}>Nasze&nbsp;Koty</div>
          <Link to="/available_cats" className={this.state.tab_id === '2' ? 'button active' : 'button'} onClick={this.changeStateToKocieta}>
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
          <a onClick={this.handleClick}>
            <img src={FbLogo}></img>
          </a>
          <a href="https://www.youtube.com/">
            <img src={YtLogo}></img>
          </a>
        </div>

      </div>
    )
  }
}

export default Header
