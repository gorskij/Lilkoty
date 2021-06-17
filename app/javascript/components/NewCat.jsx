import React from "react";
import { Link } from "react-router-dom";

class NewCat extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      sex: "",
      breed: "",
      status: "",
      breeding: "",
      // date_of_birth: "",
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
    this.stripHtmlEntities = this.stripHtmlEntities.bind(this);
  }

  stripHtmlEntities(str) {
    return String(str).replace(/</g, "&lt;").replace(/>/g, "&gt;");
  }

  onChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  onSubmit(event) {
    event.preventDefault();
    const url = "/api/v1/cats/create";
    const { name, sex, breed, status, breeding } = this.state;

    if (
      name.length == 0 ||
      sex.length == 0 ||
      breed.length == 0 ||
      status.length == 0 ||
      breeding.length == 0
      // date_of_birth == 0
    )
      return;

    const body = {
      name,
      sex,
      breed,
      status,
      breeding,
      // date_of_birth,
    };

    const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    })
      .then((response) => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => this.props.history.push(`/cat/${response.id}`))
      .catch((error) => console.log(error.message));
  }
  render() {
    return (
      <div className="container mt-5">
        <div className="row">
          <div className="col-sm-12 col-lg-6 offset-lg-3">
            <h1 className="font-weight-normal mb-5">Add a new cat</h1>
            <form onSubmit={this.onSubmit}>
              <div className="form-group">
                <label htmlFor="catName">Cat name</label>
                <input
                  type="text"
                  name="name"
                  id="catName"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="catSex">Sex</label>
                <input
                  type="text"
                  name="sex"
                  id="catSex"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="catBreed">Breed</label>
                <input
                  type="text"
                  name="breed"
                  id="catBreed"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="catStatus">Status</label>
                <input
                  type="text"
                  name="status"
                  id="catStatus"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="catBreeding">Breeding</label>
                <input
                  type="text"
                  name="breeding"
                  id="catBreeding"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              {/* <div className="form-group">
                <label htmlFor="catDate_of_birth">Date of birth</label>
                <input
                  type="datetime"
                  name="date_of_birth"
                  id="catDate_of_birth"
                  className="calendar"
                  value="2018-07-22"
                  min="2018-01-01"
                  max="2028-01-01"
                  required
                  onChange={this.onChange}
                />
              </div> */}
              <button type="submit" className="btn custom-button mt-3">
                Create Cat
              </button>
              <Link to="/cats" className="btn btn-link mt-3">
                Back to cats
              </Link>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default NewCat;
