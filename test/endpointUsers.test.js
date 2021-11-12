const request = require("supertest");
const { expect } = require("chai");
const app = require("../app");
const getToken = require("./helpers/helpToken");

describe("Test endpoint Users", () => {
  it("Test get /register", () => {
    request(app)
      .post("/register") // endpoint yg akan di testing
      .field("email", "unit@testing149")
      .field("password", "123")
      .field("phone", "645635795")
      .attach("image", "./test/upload/testing.jpg")
      .field("name", "testing149")
      .field("gender", "male")
      .field("level", "1")
      .field("date", "1998-10-09")
      .set("Content-Type", "multipart/form-data")
      .expect("Content-Type", /json/) // ekspektasi yg di hasilkan oleh yg di test atau outputnya.
      .expect(200) // status 200
      .then((response) => {
        expect(response.body).to.be.a("object"); // ekspektasi response object
        expect(response.body.success).to.be.a("boolean");
        expect(response.body.data).to.have.property("insertId");
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it("Test get /register with email same", () => {
    request(app)
      .post("/register") // endpoint yg akan di testing
      .field("email", "unit@testing147")
      .field("password", "123ab")
      .field("phone", "645635795")
      .attach("image", "./test/upload/testing.jpg")
      .field("name", "testing147")
      .field("address", "Ngawi")
      .field("first_name", "from")
      .field("last_name", "testing")
      .field("gender", "male")
      .field("level", "1")
      .field("date", "1998-10-09")
      .set("Content-Type", "multipart/form-data")
      .expect("Content-Type", /json/) // ekspektasi yg di hasilkan oleh yg di test atau outputnya.
      .expect(500) // status 200
      .then((response) => {
        expect(response.body).to.be.a("object"); // ekspektasi response object
        expect(response.body.success).to.be.a("boolean");
        expect(response.body).to.have.property("data").with.lengthOf(0);
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it("Test get /register with input false", () => {
    request(app)
      .post("/register") // endpoint yg akan di testing
      .field("email", "from@testing.pz")
      .field("password", "123ab")
      .field(
        "phone",
        "645635795785656465786586567569805780955758907589067489057890607589675896758967895068"
      )
      .attach("image", "./test/upload/testing.jpg")
      .field("name", "fromTesting pz")
      .field("address", "Ngawi")
      .field("first_name", "from")
      .field("last_name", "testing")
      .field("gender", "male")
      .field("level", "1")
      .field("date", "1998-10-09")
      .set("Content-Type", "multipart/form-data")
      .expect("Content-Type", /json/)
      .expect(400)
      .then((response) => {
        expect(response.body).to.be.a("object");
        expect(response.body.success).to.be.a("boolean");
        expect(response.body.error).to.have.property("errno");
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it("Test Login User", () => {
    request(app)
      .post("/login")
      .send({
        email: "zulaikha17@gmail.com",
        password: "123abc",
      })
      .expect("Content-Type", /json/)
      .expect(200)
      .then((response) => {
        expect(response.body).to.be.a("object");
        expect(response.body.success).to.be.a("boolean");
        expect(response.body).to.have.property("data");
        expect(response.body.data).to.have.property("token");
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it("Test Login User-Admin", () => {
    request(app)
      .post("/login")
      .send({
        email: "zulaikha17@gmail.com",
        password: "123abc",
      })
      .expect("Content-Type", /json/)
      .expect(200)
      .then((response) => {
        expect(response.body).to.be.a("object");
        expect(response.body).to.have.property("data");
        expect(response.body.data).to.have.property("token");
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it("Test Login User-Admin with email failed", () => {
    request(app)
      .post("/login")
      .send({
        email: "admin@mail.com",
        password: "123abc",
      })
      .expect("Content-Type", /json/)
      .expect(200)
      .then((response) => {
        expect(response.body).to.be.a("object");
        expect(response.body).to.have.property("data");
        expect(response.body.data).to.have.property("token");
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it("Test Login User-Admin with password failed", () => {
    request(app)
      .post("/login")
      .send({
        email: "newuser@mail",
        password: "34",
      })
      .expect("Content-Type", /json/)
      .expect(500)
      .then((response) => {
        expect(response.body).to.be.a("object");
        expect(response.body).to.have.property("data").with.lengthOf(0);
        expect(response.body.code).to.be.a("number");
      })
      .catch((err) => {
        console.log(err);
      });
  });
  it("Test get /users with query", () => {
    getToken.admin().then((token) => {
      request(app)
        .get("/users")
        .set("token", token)
        .query({
          limit: 10,
          page: 1,
        })
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("data").with.lengthOf(10);
          expect(response.body.code).to.be.a("number");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test get /users", () => {
    getToken.admin().then((token) => {
      request(app)
        .get("/users")
        .set("token", token)
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("data").with.lengthOf(5);
          expect(response.body.data).to.have.property("totalPage");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test get /users from redis", () => {
    getToken.admin().then((token) => {
      request(app)
        .get("/users")
        .set("token", token)
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body.data).to.have.property("data").with.lengthOf(5);
          expect(response.body.data).to.have.property("limit");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test get details /users", () => {
    getToken.admin().then((token) => {
      request(app)
        .get("/users/503")
        .set("token", token)
        .expect("Content-Type", /json/)
        .expect(200)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body).to.have.property("data");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test Update /users/:id", () => {
    getToken.user().then((token) => {
      request(app)
        .patch("/users/509")
        .set("token", token)
        .set("Content-Type", "multipart/form-data")
        .field("email", "fromUpdate1@testing.ceo")
        .field("password", "123ab")
        .field("phone", "645635795")
        .attach("image", "./test/upload/testing.jpg")
        .field("name", "from Testing 3")
        .field("address", "Ngawi")
        .field("first_name", "from")
        .field("last_name", "testing")
        .field("gender", "male")
        .field("level", "1")
        .field("date", "1998-10-09")
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
  it("Test Update /users/:id with input false", () => {
    getToken.user().then((token) => {
      request(app)
        .patch("/users/547")
        .set("token", token)
        .set("Content-Type", "multipart/form-data")
        .field("email", "fromUpdate@testing")
        .field("password", "123ab")
        .field(
          "phone",
          "6456357954756489578969765887568734658846946896896589655896548967589654896548967586958568745648756478356747564756348765967589675869748673486734867486758675896759"
        )
        .attach("image", "./test/upload/testing.jpg")
        .field("name", "fromTesting")
        .field("address", "Ngawi")
        .field("first_name", "from")
        .field("last_name", "testing")
        .field("gender", "male")
        .field("level", "3")
        .field("date", "1998-10-09")
        .expect("Content-Type", /json/)
        .expect(400)
        .then((response) => {
          expect(response.body).to.be.a("object");
          expect(response.body).to.have.property("error");
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
  it("Test delete users", () => {
    getToken.admin().then((token) => {
      request(app)
        .delete("/users/548")
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
