import React from 'react';
import ProductItem from './ProductItem';

class ProductsList extends React.Component {
  constructor() {
    super();

    this.state = {
      category: null,
      products: []
    }
  }

  fetchProducts(id) {
    fetch(`/api/v1/categories/${id}`)
      .then((response) => {return response.json()})
      .then((data) => {
        this.setState({category: data.category, products: data.products})
      })
      .catch((error) => {
        this.setState({category: 'Products not found'});
      });
  }

  componentDidMount() {
    const categoryId = this.props.match.params.id;

    this.fetchProducts(categoryId);
  }

  render() {
    const { category, products } = this.state;

     const productsList = products.map((product, index) => {
      return (
        <ProductItem key={product.id} product={product} position={index + 1} />
      )
    });

    return (
      <div>
        <h1>{category}</h1>
        <div className="cards-list centered">{productsList}</div>
      </div>
    );
  }
}

export default ProductsList;
