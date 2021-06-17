import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Cats from "../components/Cats";
import NewCat from "../components/NewCat";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/cats" exact component={Cats} />
      <Route path="/cat" exact component={NewCat} />
    </Switch>
  </Router>
);
