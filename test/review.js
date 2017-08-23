process.env.NODE_ENV = 'test';

//Require the dev-dependencies
const chai = require('chai');
const chaiHttp = require('chai-http');
const server = require('../server/app');
const expect = chai.expect;

chai.use(chaiHttp);

describe('/POST review', () => {
  it('to create a review', function(done) {
    let newReview = {
      userId: '1',
      productId: '10',
      rating: '5',
      comment: 'Testing'
    };
    chai.request(server)
      .post('/api/review/create')
      .send(newReview)
      .end((err, res) => {
        expect(res).to.have.status(200);
        expect(res.body).to.be.a('object');
        expect(res.body).to.have.property('message').eql('Review created successfully');
        done();
      });
  });
});

describe('/POST review', () => {
  it('User ID must exist, and must be for a user with type "Customer"', function(done) {
    let newReview = {
      userId: '100',
      productId: '10',
      rating: '5',
      comment: 'Testing with non exist User ID'
    };
    chai.request(server)
      .post('/api/review/create')
      .send(newReview)
      .end((err, res) => {
        expect(res).to.have.status(400);
        expect(res.body).to.be.a('object');
        expect(res.body).to.have.property('message').eql('User ID must exist and must be with type "Customer"');
        done();
      });
  });
});