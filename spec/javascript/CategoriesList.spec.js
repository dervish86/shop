import CategoriesList from 'CategoriesList';
import React from 'react';
import fetch from 'whatwg-fetch';
import { render, shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

test('CategoriesList should render content inside it', () => {
  const categories = [
    { id: 1, name: 'Category1', image: 'http://test.image.test' },
    { id: 2, name: 'Category2', image: 'http://test.image.test' }
  ];
  const wrapper = shallow(
    <CategoriesList />
  );
  wrapper.setState({categories: categories});

  const list = wrapper.find('.cards-list');
  const items = list.find('CategoryItem')

  expect(items.length).toBe(2);
  expect(wrapper.find('h1').text()).toBe('Categories');
});
