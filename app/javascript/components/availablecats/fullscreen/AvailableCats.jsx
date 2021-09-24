import React from 'react'
import CatCard from '../../catcard/fullscreen/CatCard'
import MobileCatCard from '../../catcard/mobiledevice/MobileCatCard'
import './available_cats_styles.scss'
import PropTypes from 'prop-types'
class AvailableCats extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      cats: [],
      classnameClick: false
    }
    this.changingClasses = this.changingClasses.bind(this)
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
      .catch((error) => console.log(error))
  }

  toggleAllBoxes (e) {
    const boxes = Array.from(document.getElementsByTagName('div'))
    boxes.forEach((element) => {
      if (element.classList.contains('active') === true) {
        element.classList.toggle('active')
      }
    })
    e.currentTarget.classList.toggle('active')
  }

  changingClasses (e) {
    if (e.currentTarget.classList.contains('active') === true) {
      e.currentTarget.classList.toggle('active')
    } else {
      this.toggleAllBoxes(e)
    }
  }

  render () {
    const { cats } = this.state

    const allCats = cats.map((cat, index) => (
      <div key={index}>
        <div className='cat-card-row' onClick={this.toggleAllBoxes} style={{ backgroundImage: `url(${cat.profile_image_url})` }}>
          <CatCard cat={cat} key={index} />
        </div>
        <div className='mobile-cat-card-row'>
          <MobileCatCard cat={cat} key={index}/>
        </div>
      </div>
    ))

    return (
      <>
        <div className="available-cats-container">
          {allCats}
        </div>
      </>
    )
  }
}

AvailableCats.propTypes = {
  match: PropTypes.object
}

export default AvailableCats
