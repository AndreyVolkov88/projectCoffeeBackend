const request = require('supertest');
const { expect } = require('chai');
const app = require('../app');
const getToken = require('./helpers/helpToken');

describe('Test endpoint Transaction', () => {
  const payload = {
    address: 'JL deandles',
    delivery_method: 'Pick up',
    payment_method: 'Bank Account',
    time: '10:10:10',
    total: 100000,
    remark: 'Rouf',
    subtotal: 10000,
    shipping: 20000,
    user_id: 2,
    details: [
      {
        products_id: 3,
        qty: 3,
        price: 35000,
      },
      {
        products_id: 4,
        qty: 3,
        price: 25000,
      },
    ],
  };
  it('Test get /transaction/:id with id user', () => {
    getToken.user().then((token) => {
      request(app)
        .get('/transaction/3')
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
  it('Test get /transaction/:id with id user from redis', () => {
    getToken.user().then((token) => {
      request(app)
        .get('/transaction/3')
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
  it('Test add transaction', () => {
    getToken.user().then((token) => {
      request(app)
        .post('/transaction')
        .set('token', token)
        .send(payload)
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
  it('Test delete transaction with id transaction', () => {
    getToken.user().then((token) => {
      request(app)
        .delete('/transaction/42')
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
});
