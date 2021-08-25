import React from 'react'
import PropTypes from 'prop-types'
import ReactPlayer from 'react-player'
import '../../assets/stylesheets/news_card_styles.scss'
class NewsCard extends React.Component {
  render () {
    const { news } = this.props

    return (
      <div className="news-card">
          <div className="news-title">{news.title}</div>
          <div className="container-content-img">
            <img src={news.image_url} className="news-img"/>
            <div className="news-content">{news.content}</div>
          </div>
          {ReactPlayer.canPlay(news.video_url) === true ?
            <ReactPlayer url={news.video_url} controls={true} className="news-video"/>
          : null}
      </div>
    )
  }
}


NewsCard.propTypes = {
  news: PropTypes.object
}
export default NewsCard
