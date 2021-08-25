import React from 'react'
import BreedCard from './BreedCard'
import '../../assets/stylesheets/breeds_styles.scss'
class Breeds extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      breeds: []
    }
  }

  componentDidMount () {
    const url = '/api/v1/breeds/index'
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then((response) => this.setState({ breeds: response }))
      .catch((error) => console.log(error))
  }

  render () {
    const { breeds } = this.state
    const allBreeds = breeds.map((breed, index) => (
        <BreedCard breed={breed} key={index}/>
    ))

    return (
      <>
        <h1 className="breeds-title">Rasy</h1>
        <main className="container">
         <div className="row">{allBreeds}</div>
        </main>
      </>
    )
  }
}

export default Breeds
