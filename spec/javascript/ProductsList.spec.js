import ProductsList from 'ProductsList';
import React from 'react';
import fetch from 'whatwg-fetch';
import { render, shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

test('ProductsList should render content inside it', () => {
  const category = 'Category Name';
  const products = [
    { id: 1, name: 'Product1', image: 'http://test.image.test', url: 'http://test.product1.test' },
    { id: 2, name: 'Product2', image: 'http://test.image.test', url: 'http://test.product1.test' }
  ];
  const wrapper = shallow(
    <ProductsList match={{params: {id: 1}}} />
  );

  wrapper.setState({category: category, products: products});

  const list = wrapper.find('.cards-list');
  const items = list.find('ProductItem')

  expect(items.length).toBe(2);
  expect(wrapper.find('h1').text()).toBe('Category Name');
});
