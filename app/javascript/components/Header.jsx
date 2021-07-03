import React from 'react'
import '../../assets/stylesheets/header.scss';
import '../../assets/stylesheets/application.scss'
import { Link } from "react-router-dom";

class Header extends React.Component{
  render (){
    return (
      <div className="Header">
        <h1>SFPOPOS</h1>
        <Link to='/litters'>bagno</Link>
      </div>
    )
  }
}

export default Header