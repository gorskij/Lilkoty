import React from 'react'
import '../../assets/stylesheets/breed_styles.scss'
import PropTypes from 'prop-types'
class Breed extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      breed: ''
    }
  }

  componentDidMount () {
    const {
      match: {
        params: { id }
      }
    } = this.props

    const url = `/api/v1/breeds/show/${id}`

    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then((response) => this.setState({ breed: response }))
      .catch((error) => console.log(error))
  }

  render () {
    const { breed } = this.state

    return (
      <div>
        {breed.name}
      </div>
    )
  }
}

Breed.propTypes = {
  match: PropTypes.object
}

export default Breed
