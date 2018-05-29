import CategoryItem from 'CategoryItem';
import React from 'react';
import { shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

test('CategoryItem render content inside it', () => {
  const category = { id: 1, name: 'TestCategory', image: 'http://test.image.test' };
  const wrapper = shallow(
    <CategoryItem category={category} />
  );

  const h3 = wrapper.find('h3');
  const img = wrapper.find('img')

  expect(h3.text()).toBe('TestCategory');
  expect(img.prop('src')).toBe('http://test.image.test');
  expect(img.prop('alt')).toBe('TestCategory');
});
