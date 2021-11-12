const request = require("supertest");
const { expect } = require("chai");
const app = require("../app");
const getToken = require("./helpers/helpToken");

describe("Test endpoint Transaction", () => {
  const payload = {
    address: "JL deandles",
    delivery_method: "Pick up",
    payment_method: "Bank Account",
    total: 100000,
    phone: "+628758846",
    remark: "Rouf",
    subtotal: 10000,
    tax: 15000,
    shipping: 20000,
    user_id: 503,
    details: [
      {
        products_id: 63,
        qty: 3,
        price: 35000,
      },
    ],
  };
  it("Test get /transaction/:id with id user", () => {
    getToken.user().then((token) => {
      request(app)
        .get("/transaction/503")
        .set("token", token)
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("data");
          expect(response.body).to.have.property("code");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test get /transaction/:id with id user", () => {
    getToken.user().then((token) => {
      request(app)
        .get("/transaction/503")
        .set("token", token)
        .query({
          limit: 3,
          page: 1,
        })
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("data").with.lengthOf(3);
          expect(response.body).to.have.property("code");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test get /transaction/:id with id user from redis", () => {
    getToken.user().then((token) => {
      request(app)
        .get("/transaction/503")
        .set("token", token)
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("data").with.lengthOf(5);
          expect(response.body).to.have.property("code");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test add transaction", () => {
    getToken.user().then((token) => {
      request(app)
        .post("/transaction")
        .set("token", token)
        .send(payload)
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("insertId");
          expect(response.body).to.have.property("code");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test delete transaction with id transaction", () => {
    getToken.user().then((token) => {
      request(app)
        .delete("/transaction/42")
        .set("token", token)
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("affectedRows");
          expect(response.body).to.have.property("code");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
});
