import React from 'react'
import { Link } from 'react-router-dom'
import PropTypes from 'prop-types'
import '../../assets/stylesheets/litters_styles.scss'

class LitterProfileContainer extends React.Component {
  render () {
    const { litter } = this.props

    return (
      <div className="litter-container">
        <h5 className="litter-date_of_creation">{litter.date_of_creation}</h5>
        <h5 className="litter-name">{litter.name}</h5>
        <img src={litter.profile_image_url} className="litter-profile-img"/>
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
