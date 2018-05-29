import React from 'react';
import { Link } from 'react-router-dom';

const CategoryItem = ({ category }) => (
  <Link to={`/categories/${category.id}`} className="card">
    <img src={category.image} alt={category.name} className="centered"/>
    <div className="card-footer">
      <h3>{category.name}</h3>
    </div>
  </Link>
)

export default CategoryItem;
