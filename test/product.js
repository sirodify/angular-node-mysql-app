process.env.NODE_ENV = 'test';

//Require the dev-dependencies
const chai = require('chai');
const chaiHttp = require('chai-http');
const server = require('../server/app');
const expect = chai.expect;

chai.use(chaiHttp);

describe('/GET products', () => {
  it('should list 10 latest products', function(done) {
    chai.request(server)
      .get('/api/products')
      .end(function(err, res){
        expect(res).to.have.status(200);
        expect(res.body).to.be.a('array');
        expect(res.body).to.have.lengthOf.at.most(10);
        expect(res.body[0]).to.have.property('id');
        expect(res.body[0]).to.have.property('description');
        expect(res.body[0].brand).to.have.property('name');
        expect(res.body[0].review).to.have.lengthOf.at.most(1);
        done();
      });
  });
});

describe('/GET/:id products', () => {
  it('should return products for that brand only', function(done) {
    chai.request(server)
      .get('/api/products/4')
      .end(function(err, res){
        expect(res).to.have.status(200);
        expect(res.body).to.be.a('array');
        expect(res.body).to.have.lengthOf.at.most(10);
        expect(res.body[0]).to.have.property('id');
        expect(res.body[0]).to.have.property('description');
        expect(res.body[0].brand).to.have.property('name');
        expect(res.body[0].brand.name).eql('Karen Walker');
        expect(res.body[0].review).to.have.lengthOf.at.most(1);
        done();
      });
  });
});
