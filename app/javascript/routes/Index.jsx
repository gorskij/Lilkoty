import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Litters from "../components/Litters"
import Litter from "../components/Litter"

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/litters" exact component={Litters} />
      <Route path="/litter/:id" exact component={Litter} />
    </Switch>
  </Router>
);
