import React, { useState, useEffect } from 'react'
import CatCard from '../../catcard/fullscreen/CatCard'
import MobileCatCard from '../../catcard/mobiledevice/MobileCatCard'
import './available_cats_styles.scss'
const AvailableCats = () => {
  const [cats, setCats] = useState([])
  const [currentBox, setCurrentBox] = useState(null)

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
  const setActiveBox = (boxId) => {
    setCurrentBox(boxId)
  }

  const allCats = cats.map((cat, index) => (
      <div key={index}>
        <div className={currentBox === index ? 'cat-card-row active' : 'cat-card-row'} onClick={(boxId) => setActiveBox(index)} style={{ backgroundImage: `url(${cat.profile_image_url})` }}>
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

export default AvailableCats
