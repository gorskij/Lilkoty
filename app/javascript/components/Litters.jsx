import React from 'react'
import LitterProfileContainer from './LitterProfileContainer'
import '../../assets/stylesheets/litters_styles.scss'
import PropTypes from 'prop-types'
class Litters extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      litters: []
    }
  }

  componentDidMount () {
    const url = '/api/v1/litters/index'
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then((response) => this.setState({ litters: response }))
      .catch(() => this.props.history.push('/'))
  }

  render () {
    const { litters } = this.state
    const allLitters = litters.map((litter, index) => (
      <div key={index}>
        <LitterProfileContainer litter={litter}/>
      </div>
    ))

    return (
      <>
        <h1 className="litters-title">Mioty</h1>
        <main className="container">
         <div className="row">{allLitters}</div>
        </main>
      </>
    )
  }
}

Litters.propTypes = {
  match: PropTypes.func,
  history: PropTypes.string
}

export default Litters
