import React from "react";
import { Link } from "react-router-dom";
import '../../assets/stylesheets/litters_styles.scss'

class Litters extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      litters: [],
    };
  }
  componentDidMount() {
    const url = "/api/v1/litters/index";
    fetch(url)
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => this.setState({ litters: response }))
      .catch(() => this.props.history.push("/"));
  }
  render() {
    const { litters } = this.state;
    
    const allLitters = litters.map((litter, index) => (
      <div key={index}>
        <div className="litter-container">
          <h5 className="litter-date_of_creation">{litter.date_of_creation}</h5>
          <h5 className="litter-name">{litter.name}</h5>
          <Link to={`/litter/${litter.id}`} className="btn custom-button">
            View Litter
          </Link>
        </div>
      </div>
    ));

    return (
      <>
        <main className="container">
         <div className="row">{allLitters}</div>
        </main>
      </>
    );
  }
}
export default Litters;
