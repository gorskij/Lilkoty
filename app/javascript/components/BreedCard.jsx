import React from 'react'
import PropTypes from 'prop-types'
import { Link } from 'react-router-dom'
import '../../assets/stylesheets/breed_card_styles.scss'
class BreedCard extends React.Component {
  render () {
    const { breed } = this.props

    return (
      <div className="breed-card">
          <h1>{breed.name}</h1>
          <Link to={`/breed/${breed.id}`} className="btn custom-button">
            Zobacz Rasę
          </Link>
        </div>
    )
  }
}

BreedCard.propTypes = {
  breed: PropTypes.object
}
export default BreedCard
