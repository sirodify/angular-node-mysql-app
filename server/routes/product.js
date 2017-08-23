const models = require('../models');

// GET /products/ to retrieve latest 10 product listing.
const getLatest = (req, res) => {
  models.product.findAll({
    include: [
      {
        model: models.brand, as: 'brand'
      },
      {
        model: models.review, as: 'review',
        limit: 1,
        order: [['createdAt', 'DESC']],
        include: [{
          model: models.user, as: 'user'
        }]
      }
    ],
    limit: 10,
    order: [[ 'dateCreated', 'DESC' ]]
  })
    .then((products) => {
      res.send(products);
    });
};

// GET /product/:id to retrieve latest 10 product listing given its brand id
const getLatestByBrand = (req, res) => {
  const id = req.params.id;
  models.product.findAll({
    include: [
      {
        model: models.brand, as: 'brand'
      },
      {
        model: models.review, as: 'review',
        limit: 1,
        order: [['createdAt', 'DESC']],
        include: [{
          model: models.user, as: 'user'
        }]
      }
    ],
    limit: 10,
    where: { brandId: id },
    order: [[ 'dateCreated', 'DESC' ]]
  })
    .then((products) => {
      res.send(products);
    });
};

// export all functions
module.exports = { getLatest, getLatestByBrand };