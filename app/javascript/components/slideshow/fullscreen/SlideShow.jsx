import React, { useState } from 'react'
import PropTypes from 'prop-types'
import './slide_show.scss'
import { RiArrowRightSLine, RiArrowLeftSLine } from 'react-icons/ri'

const SlideShow = (props) => {
  const [currentImage, setCurrentImage] = useState(0)

  const changeImage = (direction) => {
    const numberOfImages = props.cat.images.length - 1
    const nextImage = currentImage + direction
    if (nextImage > numberOfImages) {
      setCurrentImage(0)
    } else {
      if (nextImage < 0) {
        setCurrentImage(numberOfImages)
      } else {
        setCurrentImage(nextImage)
      }
    }
  }
  function slideShowDots () {
    const images = props.cat.images
    return (
      <div className='dot-bar'>
        { images.map((image, index) => (
          <span className={index === currentImage ? 'dot active' : 'dot'} key={image.id}></span>
        ))}
      </div>
    )
  }

  return (
      <div className='slide-show'>
        <button onClick={(direction) => changeImage(-1)} className='prev-button'><RiArrowLeftSLine/></button>
        <img src={props.cat.images[currentImage].url}></img>
        {slideShowDots()}
        <button onClick={(direction) => changeImage(1)} className='next-button'><RiArrowRightSLine/></button>
      </div>
  )
}
SlideShow.propTypes = {
  cat: PropTypes.object
}
export default SlideShow
