import React, { useState, useEffect } from 'react'
import './breedingcats_styles.scss'
import SlideShow from '../../slideshow/fullscreen/SlideShow.jsx'

const BreedingCats = () => {
  const [cats, setCats] = useState([])

  useEffect(() => {
    const url = '/api/v1/cats/available'

    const renderCats = async () => {
      await fetch(url)
        .then((response) => {
          if (response.ok) {
            return response.json()
          }
          throw new Error('Response was not ok')
        })
        .then((response) => setCats(response))
    }
    renderCats()
  }, [])

  const breedingCats = cats.map((cat, index) => (
    <div className='breeding-cat-row' key={index}>
      <div className='cat-breeding-card'>
        <SlideShow cat={cat}></SlideShow>
        <div className='breeding-cat-informations'>
          <div className='breeding-cat-name'>{cat.name}</div>
          <div>data urodzenia: {cat.date_of_birth}</div>
          <div>kolor: {cat.colour}</div>
          <div className='breeding-cat-parents'>
            <div>
              <div>matka:</div>
              <img src={cat.profile_image_url}/>
              <div>imie</div>
            </div>
            <div>
              <div>ojciec:</div>
              <img src={cat.profile_image_url}/>
              <div>imie</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  ))
  return (
    <div className='cat-breeding-container'>
      {breedingCats}
    </div>
  )
}

export default BreedingCats
