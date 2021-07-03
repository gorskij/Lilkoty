import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Litters from "../components/Litters"
import Litter from "../components/Litter"
import AvailableCats from "../components/AvailableCats";
import Header from "../components/Header";

export default (
  <Router>
    <Header/>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/litters" exact component={Litters} />
      <Route path="/litter/:id" exact component={Litter} />
      <Route path="/available_cats" exact component={AvailableCats} />
    </Switch>
  </Router>
);
