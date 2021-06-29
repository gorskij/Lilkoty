import React from "react";
import { Link } from "react-router-dom";
import Header from "./Header";

function HomePage() {
  return (
    <div className="HomePage">
      <h1> HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH</h1>
      <Link to="/litters" className="btn btn-link">
        Litters
      </Link>
    </div>
  );
}

export default HomePage;