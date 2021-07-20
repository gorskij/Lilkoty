import React from 'react'
import PropTypes from 'prop-types'
import { Link } from 'react-router-dom'
import '../../assets/stylesheets/cat_profile_container_styles.scss'
class CatProfileContainer extends React.Component {
  render () {
    const { cat } = this.props

    const profilePicture = cat.images.map((image, index) => (
      (() => {
        if (image.role === 'profile') {
          return <img src={image.url} className="cat-profile-img"/>
        }
      })()
    ))

    return (
      <div className="cat-profile-container">
        {profilePicture}
        <div className="cat-profile-inf">
          <h1>{cat.name}</h1>
          <div className="cat-profile-status">Status : {cat.status}</div>
          <div className="cat-profile-breed">Rasa : {cat.breed}</div>
          <Link to={`/cat/${cat.id}`} className="btn custom-button">
            View cat
          </Link>
        </div>
      </div>
    )
  }
}

CatProfileContainer.propTypes = {
  cat: PropTypes.object
}
export default CatProfileContainer
