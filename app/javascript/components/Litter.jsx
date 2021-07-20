import React from 'react'
import { Link } from 'react-router-dom'
import CatProfileContainer from './CatProfileContainer'
import '../../assets/stylesheets/litter_styles.scss'
import PropTypes from 'prop-types'
class Litter extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      litter: {
        father: { images: [{ url: '' }] },
        mother: { images: [{ url: '' }] },
        kittens: [{ images: [{ url: '' }] }]
      }
    }
  }

  componentDidMount () {
    const {
      match: {
        params: { id }
      }
    } = this.props

    const url = `/api/v1/litters/show/${id}`

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then(response => this.setState({ litter: response }))
      .catch((error) => console.log(error))
  }

  render () {
    const { litter } = this.state

    const allKittens = litter.kittens.map((kitten, index) => (
        <CatProfileContainer cat={kitten} key={index}/>
    ))

    return (
      <>
          <h1 className="container-title">Rodzice</h1>
          <div className="parents-flex-container">
            <CatProfileContainer cat={litter.mother}/>
            <CatProfileContainer cat={litter.father}/>
          </div>
          <h1 className="container-title">Kocięta</h1>
          <div className="kittens-flex-container">
            {allKittens}
          </div>
          <Link to="/litters" className="btn btn-link">
            Back to litters
          </Link>
      </>
    )
  }
}

Litter.propTypes = {
  match: PropTypes.object
}

export default Litter
