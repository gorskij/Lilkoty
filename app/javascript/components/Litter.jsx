import React from "react";
import { Link } from "react-router-dom";

class Litter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { litter: {mother: {images_url: ''}}};
  }

  componentDidMount() {
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/litters/show?id=${id}`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ litter: response }))
      .catch(() => this.props.history.push("/litters"));
  }

  render() {
    const { litter } = this.state;

    return (
      <>
          <h1 className="litter-name">
            {litter.name}
          </h1>
         <img src={litter.mother.images_url[3]}/>
          <Link to="/litters" className="btn btn-link">
            Back to litters
          </Link>
      </>
    );
  }

}

export default Litter;