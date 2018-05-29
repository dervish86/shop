import React from 'react';
import { Link } from 'react-router-dom';

const ProductItem = ({product, position}) => (
  <Link to={product.url} target="_blank" className="card">
    <div className="card-header">
      <p># {position}</p>
      <p>$ {product.price}</p>
    </div>
    <img src={product.image} alt={product.name} className="centered"/>
    <div className="card-footer">
      <p>{product.name}</p>
    </div>
  </Link>
)

export default ProductItem;
