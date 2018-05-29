import ProductItem from 'ProductItem';
import React from 'react';
import { shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

test('ProductItem should render content inside it', () => {
  const product = {
    id: 1,
    name: 'Product1',
    price: '12.05',
    url: 'http://test.product1.test',
    image: 'http://test.product_image.test'
  };

  const wrapper = shallow(
    <ProductItem product={product} position={1} />
  );

  const header = wrapper.find('.card-header');
  const footer = wrapper.find('.card-footer');
  const img = wrapper.find('img')

  expect(header.find('p').at(0).text()).toBe('# 1');
  expect(header.find('p').at(1).text()).toBe('$ 12.05');

  expect(img.prop('src')).toBe('http://test.product_image.test');
  expect(img.prop('alt')).toBe('Product1');

  expect(footer.find('p').text()).toBe('Product1');
});
