const request = require('supertest');
const { expect } = require('chai');
const app = require('../app');
const getToken = require('./helpers/helpToken');

describe('Test endpoint Users', () => {
  it('Test get /register', () => {
    request(app)
      .post('/register') // endpoint yg akan di testing
      .field('email', 'unit@testing127')
      .field('password', '123ab')
      .field('phone', '645635795')
      .attach('image', './test/upload/testing.jpg')
      .field('name', 'unit testing127')
      .field('address', 'Ngawi')
      .field('first_name', 'from')
      .field('last_name', 'testing')
      .field('gender', 'male')
      .field('level', '1')
      .field('date', '1998-10-09')
      .set('Content-Type', 'multipart/form-data')
      .expect('Content-Type', /json/) // ekspektasi yg di hasilkan oleh yg di test atau outputnya.
      .expect(200) // status 200
      .then((response) => {
        expect(response.body).to.be.a('object'); // ekspektasi response object
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it('Test get /register with email same', () => {
    request(app)
      .post('/register') // endpoint yg akan di testing
      .field('email', 'from@testing')
      .field('password', '123ab')
      .field('phone', '645635795')
      .attach('image', './test/upload/testing.jpg')
      .field('name', 'fromTesting')
      .field('address', 'Ngawi')
      .field('first_name', 'from')
      .field('last_name', 'testing')
      .field('gender', 'male')
      .field('level', '1')
      .field('date', '1998-10-09')
      .set('Content-Type', 'multipart/form-data')
      .expect('Content-Type', /json/) // ekspektasi yg di hasilkan oleh yg di test atau outputnya.
      .expect(500) // status 200
      .then((response) => {
        expect(response.body).to.be.a('object'); // ekspektasi response object
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it('Test get /register with input false', () => {
    request(app)
      .post('/register') // endpoint yg akan di testing
      .field('email', 'from@testing.pyz')
      .field('password', '123ab')
      .field('phone', '64563579578565646578658656758')
      .attach('image', './test/upload/testing.jpg')
      .field('name', 'fromTesting pyz')
      .field('address', 'Ngawi')
      .field('first_name', 'from')
      .field('last_name', 'testing')
      .field('gender', 'male')
      .field('level', '1')
      .field('date', '1998-10-09')
      .set('Content-Type', 'multipart/form-data')
      .expect('Content-Type', /json/) // ekspektasi yg di hasilkan oleh yg di test atau outputnya.
      .expect(400) // status 200
      .then((response) => {
        expect(response.body).to.be.a('object'); // ekspektasi response object
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it('Test Login User', () => {
    request(app)
      .post('/login')
      .send({
        email: 'sincere@april.biz',
        password: '234def',
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
  it('Test Login User-Admin', () => {
    request(app)
      .post('/login')
      .send({
        email: 'newuser@mail',
        password: '123ab',
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
  it('Test Login User-Admin with email failed', () => {
    request(app)
      .post('/login')
      .send({
        email: 'Admin@mail.com',
        password: '1234',
      })
      .expect('Content-Type', /json/)
      .expect(500)
      .then((response) => {
        expect(response.body).to.be.a('object');
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it('Test Login User-Admin with password failed', () => {
    request(app)
      .post('/login')
      .send({
        email: 'newuser@mail',
        password: '34',
      })
      .expect('Content-Type', /json/)
      .expect(500)
      .then((response) => {
        expect(response.body).to.be.a('object');
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it('Test get /users with query', () => {
    getToken.admin().then((token) => {
      request(app)
        .get('/users')
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
  it('Test get /users', () => {
    getToken.admin().then((token) => {
      request(app)
        .get('/users')
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
  it('Test get /users from redis', () => {
    getToken.admin().then((token) => {
      request(app)
        .get('/users')
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
  it('Test get details /users', () => {
    getToken.admin().then((token) => {
      request(app)
        .get('/users/2')
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
  it('Test Update /users/:id', () => {
    getToken.user().then((token) => {
      request(app)
        .patch('/users/484')
        .set('token', token)
        .set('Content-Type', 'multipart/form-data')
        .field('email', 'fromUpdate1@testing.ceo')
        .field('password', '123ab')
        .field('phone', '645635795')
        .attach('image', './test/upload/testing.jpg')
        .field('name', 'from Testing 3')
        .field('address', 'Ngawi')
        .field('first_name', 'from')
        .field('last_name', 'testing')
        .field('gender', 'male')
        .field('level', '1')
        .field('date', '1998-10-09')
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
  it('Test Update /users/:id with input false', () => {
    getToken.user().then((token) => {
      request(app)
        .patch('/users/483')
        .set('token', token)
        .set('Content-Type', 'multipart/form-data')
        .field('email', 'fromUpdate@testing')
        .field('password', '123ab')
        .field('phone', '64563579547564895789675896759')
        .attach('image', './test/upload/testing.jpg')
        .field('name', 'fromTesting')
        .field('address', 'Ngawi')
        .field('first_name', 'from')
        .field('last_name', 'testing')
        .field('gender', 'male')
        .field('level', '1')
        .field('date', '1998-10-09')
        .expect('Content-Type', /json/)
        // .expect(400)
        .then((response) => {
          expect(response.body).to.be.a('object');
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it('Test delete users', () => {
    getToken.admin().then((token) => {
      request(app)
        .delete('/users/497')
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
