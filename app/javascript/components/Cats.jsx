import React from "react";
import { Link } from "react-router-dom";

class Cats extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      cats: [],
    };
  }
  componentDidMount() {
    const url = "/api/v1/cats/index";
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
      <div key={index} className="col-md-6 col-lg-4">
        <div className="card-body">
          <h5 className="card-title">{cat.name}</h5>
          <Link to={`/cat/${cat.id}`} className="btn custom-button">
            View Cat
          </Link>
        </div>
      </div>
    ));
    const noCat = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No cats yet. Why not <Link to="/new_cat">create one</Link>
          penis
        </h4>
      </div>
    );

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5"></div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="text-right mb-3">
              <Link to="/cat" className="btn custom-button">
                Create New Cat
              </Link>
            </div>
            <div className="row">{cats.length > 0 ? allCats : noCat}</div>
            {/* <Link to="/" className="btn btn-link">
              Home
            </Link> */}
          </main>
        </div>
      </>
    );
  }
}
export default Cats;
