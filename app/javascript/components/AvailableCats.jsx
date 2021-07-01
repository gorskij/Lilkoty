import React from 'react'
import { Link } from "react-router-dom";

class AvailableCats extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      cats: [],
    };
  }
  componentDidMount() {
    const url = "/api/v1/cats/available";
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => this.setState({ cats: response }))
      .catch(() => this.props.history.push("/"));
  }
  render() {
    const { cats } = this.state;
    
    const allCats = cats.map((cat, index) => (
      <div key={index}>
          <h5>{cat.name}</h5>
        </div>
    ));

    return (
      <>
        <h1>Available Cats</h1>
        <main className="container">
         <div className="row">{allCats}</div>
        </main>
      </>
    );
  }
}

export default AvailableCats