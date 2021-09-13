const request = require('supertest');
const { expect } = require('chai');
const app = require('../app');
const getToken = require('./helpers/helpToken');

describe('Test endpoint Products', () => {
  it('Test get /products', () => {
    getToken.user().then((token) => {
      request(app)
        .get('/products')
        .set('token', token)
        .expect('Content-Type', /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test get /products with query', () => {
    getToken.user().then((token) => {
      request(app)
        .get('/products')
        .set('token', token)
        .query({
          limit: 10,
          page: 1,
        })
        .expect('Content-Type', /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test get /products/:id', () => {
    getToken.user().then((token) => {
      request(app)
        .get('/products/2')
        .set('token', token)
        .expect('Content-Type', /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test add products', () => {
    getToken.admin().then((token) => {
      request(app)
        .post('/products')
        .set('token', token)
        .set('Content-Type', 'multipart/form-data')
        .field('name', 'Choco Uno')
        .field('description', 'dfdkjuibuf gfdgffjgj')
        .field('stock', '24')
        .attach('image', './test/upload/coffee.jpg')
        .field('discount', '10')
        .field('category_id', '2')
        .field('delivery_days', 'Monday')
        .field('details[0][size]', 'L')
        .field('details[0][price]', '20000')
        .field('details[1][size]', 'XL')
        .field('details[1][price]', '30000')
        .expect('Content-Type', /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test add /products with token user', () => {
    getToken.user().then((token) => {
      request(app)
        .post('/products')
        .set('token', token)
        .expect('Content-Type', /json/)
        .expect(500)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test update /products', () => {
    getToken.admin().then((token) => {
      request(app)
        .patch('/products/19')
        .set('token', token)
        .set('Content-Type', 'multipart/form-data')
        .field('name', 'Choco Uno')
        .field('description', 'lorem ipdkdfgd jkhfgsdffbdsf')
        .field('stock', '24')
        .attach('image', './test/upload/coffee.jpg')
        .field('discount', '10')
        .field('category_id', '2')
        .field('delivery_days', 'Monday')
        .field('delivery_time', '1 - 5 PM')
        .field('details[0][id_size]', '42')
        .field('details[0][size]', 'L')
        .field('details[0][price]', '20000')
        .field('details[1][id_size]', '43')
        .field('details[1][size]', 'XL')
        .field('details[1][price]', '30000')
        .expect('Content-Type', /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test delete products', () => {
    getToken.admin().then((token) => {
      request(app)
        .delete('/products/21')
        .set('token', token)
        .expect('Content-Type', /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test delete products with token user', () => {
    getToken.user().then((token) => {
      request(app)
        .delete('/products/64')
        .set('token', token)
        .expect('Content-Type', /json/)
        .expect(500)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
});
