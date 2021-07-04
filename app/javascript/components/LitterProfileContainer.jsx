import React from 'react'
import { Link } from 'react-router-dom'
import PropTypes from 'prop-types'

class LitterProfileContainer extends React.Component {
  render () {
    const { litter } = this.props
    const profilePicture = litter.images.map((image, index) => (
      (() => {
        if (image.role === 'profile') {
          return <img src={image.url} width="80%" height="80%"/>
        }
      })()
    ))

    return (
      <div className="litter-container">
        <h5 className="litter-date_of_creation">{litter.date_of_creation}</h5>
        <h5 className="litter-name">{litter.name}</h5>
        <div className="litter-profile-img">{profilePicture}</div>
        <Link to={`/litter/${litter.id}`} className="btn custom-button">
          View Litter
        </Link>
      </div>
    )
  }
}

LitterProfileContainer.propTypes = {
  litter: PropTypes.object
}

export default LitterProfileContainer
