import React from 'react'
import PropTypes from 'prop-types'
import './cat_card_styles.scss'
import SlideShow from '../../slideshow/fullscreen/SlideShow.jsx'
const CatCard = (props) => {
  return (
    <div className='cat-card'>
      <SlideShow cat={props.cat}></SlideShow>
      <div className='cat-info'>{props.cat.name}</div>
      <div className='cat-active-info'>
        <div className='cat-name'>{props.cat.name}</div>
        <div className='cat-data-box'>
          <div>Miot:</div>
          {/* kubzon zrobi litter name */}
          <div>Data Urodzenia: {props.cat.date_of_birth}</div>
          <div>Płeć: {props.cat.sex}</div>
          <div>Kolor: {props.cat.colour}</div>
          <div className='cat-description'><span className='special'>Charakter: </span>{props.cat.personality}</div>
          <div className='cat-status'>Status: {props.cat.status}</div>
        </div>
      </div>
    </div>
  )
}

CatCard.propTypes = {
  cat: PropTypes.object
}
export default CatCard
