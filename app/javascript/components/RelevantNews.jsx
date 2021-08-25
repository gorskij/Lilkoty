import React from 'react'
import NewsCard from './NewsCard'
import '../../assets/stylesheets/relevant_news_styles.scss'
class RelevantNews extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      news: []
    }
  }

  componentDidMount () {
    const url = '/api/v1/news/relevant'
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json()
        }
        throw new Error('Network response was not ok.')
      })
      .then((response) => this.setState({ news: response }))
      .catch((error) => console.log(error))
  }

  render () {
    const { news } = this.state
    const allNews = news.map((news, index) => (
        <NewsCard news={news} key={index}/>
    ))

    return (
      <>
        <h1 className="news-title">Aktualności</h1>
        <main className="container">
         <div className="row">{allNews}</div>
        </main>
      </>
    )
  }
}

export default RelevantNews
