import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import CategoriesList from './CategoriesList';
import ProductsList from './ProductsList';
import NotFound from './NotFound';

const App = (props) => (
  <Router>
    <div>
      <Switch>
        <Route exact path='/' component={CategoriesList} />
        <Route path='/categories/:id' component={ProductsList} />
        <Route component={NotFound} />
      </Switch>
    </div>
  </Router>
)

export default App;
