import React from 'react'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import Home from '../components/Home'
import Litters from '../components/Litters'
import Litter from '../components/Litter'
import AvailableCats from '../components/availablecats/fullscreen/AvailableCats'
import Header from '../components/header/fullscreen/Header.jsx'
import SmallScreenMenu from '../components/header/mobiledevice/SmallScreenMenu'
import Breed from '../components/Breed'
import Breeds from '../components/Breeds'
import News from '../components/News'

export default (
  <Router>
   <Header/>
   <SmallScreenMenu/>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/litters" exact component={Litters} />
      <Route path="/litter/:id" exact component={Litter} />
      <Route path="/cat/:id" exact component={Cat} />
      <Route path="/available_cats" exact component={AvailableCats} />
      <Route path="/breeds" exact component={Breeds} />
      <Route path="/breed/:id" exact component={Breed} />
      <Route path="/news" exact component={News} />
    </Switch>
  </Router>
)
