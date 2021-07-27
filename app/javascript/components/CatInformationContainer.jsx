import React from 'react'
import PropTypes from 'prop-types'
import { Link } from 'react-router-dom'
import '../../assets/stylesheets/cat_information_container_styles.scss'
class CatInformationContainer extends React.Component {
  render () {
    const { cat } = this.props

    return (
      <div className="cat-inf-container">
        <h1 className="cat-name">{cat.name}</h1>
        <div className="cat-status">Status&nbsp;:&nbsp;{cat.status}</div>
        <div className="cat-sex">Płeć&nbsp;:&nbsp;{cat.sex}</div>
        <div className="cat-breed">
          Rasa&nbsp;:&nbsp;
          <Link to={`/breed/${cat.breed.id}`}>
            {cat.breed.name}
          </Link>
        </div>
        <div className="cat-colour">Kolor&nbsp;:&nbsp;{cat.colour}</div>
        <div className="cat-breeding">Hodowla&nbsp;:&nbsp;{cat.breeding}</div>
        <div className="cat-lineage-url">
          <div>Rodowód&nbsp;:&nbsp;
            <a href={cat.lineage_url} target="_blank" rel = "noopener noreferrer">Link</a>
          </div>
        </div>
      </div>
    )
  }
}

CatInformationContainer.propTypes = {
  cat: PropTypes.object
}
export default CatInformationContainer
