import React from 'react'
import CatInformationContainer from './CatInformationContainer'
import '../../assets/stylesheets/cat_styles.scss'
import PropTypes from 'prop-types'
class Cat extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      cat: { lineage_url: '', breed: '', images: [{ url: '' }] }
    }
  }

  componentDidMount () {
    const {
      match: {
        params: { id }
      }
    } = this.props

    const url = `/api/v1/cats/show/${id}`

    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then((response) => this.setState({ cat: response }))
      .catch((error) => console.log(error))
  }

  render () {
    const { cat } = this.state
    const profilePicture = cat.images.map((image, index) =>
      (() => {
        if (image.role === 'profile') {
          return <img src={image.url} />
        }
      })()
    )
    const catInformation = <CatInformationContainer cat={cat} />

    return (
      <div className="cat-profile-flex">
        <div className="cat-img-profile">{profilePicture}</div>
        {catInformation}
      </div>
    )
  }
}

Cat.propTypes = {
  match: PropTypes.object
}

export default Cat
