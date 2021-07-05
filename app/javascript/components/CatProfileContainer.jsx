import React from 'react'
import PropTypes from 'prop-types'
import { Link } from 'react-router-dom'
class CatProfileContainer extends React.Component {
  render () {
    const { cat } = this.props

    const profilePicture = cat.images.map((image, index) => (
      (() => {
        if (image.role === 'profile') {
          return <img src={image.url} width="10%" height="10%"/>
        }
      })()
    ))

    return (
      <div className="cat-profile-container">
        <h1>{cat.name}</h1>
        <div className="cat-profile-img">{profilePicture}</div>
        <div className="cat-profile-status">{cat.status}</div>
        <Link to={`/cat/${cat.id}`} className="btn custom-button">
          View cat
        </Link>
      </div>
    )
  }
}

CatProfileContainer.propTypes = {
  cat: PropTypes.object
}
export default CatProfileContainer
