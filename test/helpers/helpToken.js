const request = require('supertest');
const app = require('../../app');

const getToken = {
  admin: () => new Promise((resolve) => {
    request(app)
      .post('/login')
      .send({
        email: 'newuser@mail',
        password: '123ab',
      })
      .then((response) => {
        resolve(response.body.token);
      });
  }),
  user: () => new Promise((resolve) => {
    request(app)
      .post('/login')
      .send({
        email: 'sincere@april.biz',
        password: '234def',
      })
      .then((response) => {
        resolve(response.body.token);
      });
  }),
};

module.exports = getToken;
