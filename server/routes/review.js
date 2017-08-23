const models = require('../models');

let errorMessage = '';

// POST /create to create a review on a product
const createReview = (req, res) => {
  // request params validation
  if(!validateParams(req)) {
    res.status(400).send(errorMessage);
    return;
  }
  const userId = req.body.userId;
  const productId = req.body.productId;
  const rating = req.body.rating;
  const comment = req.body.comment;

  // verify if the userId exists in DB and is with user type Customer
  models.user.findOne({
    where: {
      id: userId,
      userType: 'Customer'
    }
  }).then(user => {
    if (user === null) {
      res.status(400).json({ message: `User ID must exist and must be with type "Customer"` });
    }
    else {
      models.review.create({
        comment: comment,
        rating: rating,
        productId: productId,
        userId: userId
      }, {
        include: [{model: models.product, as: 'product'}]
      })
        .then(() => {
          res.status(200).json({ message: 'Review created successfully' });
        }).catch((error) => {
        res.status(400).send(error);
      });
    }
  });
};

// validate request parameters
const validateParams = (req) => {
  req.assert('userId', 'userId is required and must be an integer').notEmpty().isInt();
  req.assert('productId', 'productId is required and must be an integer').notEmpty().isInt();
  req.assert('rating', 'rating is required and must be an integer between 0 to 10').notEmpty().isInt({ min: 0, max: 10 });
  req.assert('comment', 'comment is required').notEmpty();

  let errors = req.validationErrors();
  if(errors) {
    errorMessage = errors;
    return false;
  }
  return true;
};

module.exports = { createReview };
