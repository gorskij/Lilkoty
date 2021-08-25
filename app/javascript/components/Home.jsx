import React from 'react'
import { Link } from 'react-router-dom'
import RelevantNews from './RelevantNews'
function HomePage () {
  return (
    <div className="HomePage">
      <RelevantNews/>
      <h1> HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH</h1>
      <Link to="/litters" className="btn btn-link">
        Litters
      </Link>
    </div>
  )
}

export default HomePage
