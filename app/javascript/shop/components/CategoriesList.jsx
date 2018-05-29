import React from 'react';
import CategoryItem from './CategoryItem';

class CategoriesList extends React.Component {
  constructor() {
    super();
    this.state = {
      categories: []
    }
  }

  fetchCategories() {
    fetch('/api/v1/categories')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({categories: data})});
  }

  componentDidMount() {
    this.fetchCategories();
  }

  render() {
    const categories = this.state.categories.map((category) => {
      return (
        <CategoryItem key={category.id} category={category} />
      )
    });

    return (
      <div>
        <h1>Categories</h1>
        <div className="cards-list category centered">
          {categories}
        </div>
      </div>
    );
  }
}

export default CategoriesList;
