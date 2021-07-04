import React from 'react'

import '../../assets/stylesheets/litter_styles.scss'
import PropTypes from 'prop-types'
class Cat extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      cat: { images: [{ url: '' }] }
    }
  }

  componentDidMount () {
    const {
      match: {
        params: { id }
      }
    } = this.props

    const url = `/api/v1/cats/show?id=${id}`

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then(response => this.setState({ cat: response }))
      .catch((error) => console.log(error))
  }

  render () {
    const { cat } = this.state
    const profilePicture = cat.images.map((image, index) => (
      (() => {
        if (image.role === 'profile') {
          return <img src={image.url} width="10%" height="10%"/>
        }
      })()
    ))

    return (
      <>
      <h1 className="container-title">{cat.name}</h1>
      {profilePicture}
      </>
    )
  }
}

Cat.propTypes = {
  match: PropTypes.object
}

export default Cat
