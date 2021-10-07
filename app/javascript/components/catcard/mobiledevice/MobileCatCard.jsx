import React from 'react'
import PropTypes from 'prop-types'
import SlideShow from '../../slideshow/fullscreen/SlideShow.jsx'
import './mobile_catcard.scss'

const MobileCatCard = (props) => {
  const cat = props.cat
  return (
    <div className='mobile-cat-card'>
      <SlideShow cat={cat}></SlideShow>
      <div className='mobile-cat-info'>
        <div className='mobile-cat-name'>{cat.name}</div>
        <div>miot: </div>
        <div>data urodzenia: {cat.date_of_birth}</div>
        <div>płeć: {cat.sex}</div>
        <div>kolor: {cat.colour}</div>
        <div>osobowość: <span className='personality'>{cat.personality}</span></div>
        <div className='status'>status: {cat.status}</div>
      </div>
    </div>
  )
}

MobileCatCard.propTypes = {
  cat: PropTypes.object
}
export default MobileCatCard
