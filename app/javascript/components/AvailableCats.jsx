import React from 'react'
import CatProfileContainer from './CatProfileContainer'
import '../../assets/stylesheets/available_cats_styles.scss'
import PropTypes from 'prop-types'
class AvailableCats extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      cats: []
    }
  }

  componentDidMount () {
    const url = '/api/v1/cats/available'
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then((response) => this.setState({ cats: response }))
      .catch(() => this.props.history.push('/'))
  }

  render () {
    const { cats } = this.state

    const allCats = cats.map((cat, index) => (
      <div key={index}>
          <CatProfileContainer cat={cat}/>
        </div>
    ))

    return (
      <>
        <h1 className="container-title">Dostępne kociaki</h1>
        <div className="cats-flex-container">
          {allCats}
        </div>
      </>
    )
  }
}

AvailableCats.propTypes = {
  match: PropTypes.func,
  history: PropTypes.string
}

export default AvailableCats
