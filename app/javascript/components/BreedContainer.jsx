import React from 'react'
import PropTypes from 'prop-types'
import { Link } from 'react-router-dom'
import '../../assets/stylesheets/breed_container_styles.scss'
class BreedContainer extends React.Component {
  render () {
    const { breed } = this.props

    return (
      <div className="breed-container">
          <h1>{breed.name}</h1>
          <Link to={`/breed/${breed.id}`} className="btn custom-button">
            Zobacz Rasę
          </Link>
        </div>
    )
  }
}

BreedContainer.propTypes = {
  breed: PropTypes.object
}
export default BreedContainer
