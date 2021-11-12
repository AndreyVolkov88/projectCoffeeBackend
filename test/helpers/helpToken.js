const request = require("supertest");
const app = require("../../app");

const getToken = {
  admin: () =>
    new Promise((resolve) => {
      request(app)
        .post("/login")
        .send({
          email: "admin@mail.com",
          password: "123abc",
        })
        .then((response) => {
          resolve(response.body.data.token);
        });
    }),
  user: () =>
    new Promise((resolve) => {
      request(app)
        .post("/login")
        .send({
          email: "zulaikha17@gmail.com",
          password: "123abc",
        })
        .then((response) => {
          resolve(response.body.data.token);
        });
    }),
};

module.exports = getToken;
