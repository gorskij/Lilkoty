import React from "react";
import { Link } from "react-router-dom";

class Litter extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
       litter: {
        mother: '',
        father: '',
        mother: {images: [{url: ''}]}
      }
    };
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
            {litter.mother.name}
          </h1>
          <h1 className="litter-name">
            {litter.father.name}
          </h1>
         <img src={litter.mother.images[0].url } width="50%" height="50%"/>
          <Link to="/litters" className="btn btn-link">
            Back to litters
          </Link>
      </>
    );
  }

}

export default Litter;