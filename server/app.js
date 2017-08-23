const express = require('express');
const path = require('path');
const logger = require('morgan');
const bodyParser = require('body-parser');
const validator = require('express-validator');

const product = require('./routes/product');
const review = require('./routes/review');

const port = process.env.PORT || '3000';
const app = express();

app.use(logger('combined'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.text());
app.use(bodyParser.json({type: 'application/json'}));
app.use(express.static(process.cwd() + '/public'));
app.use(validator());

// routing for API endpoints
app.get('/api/products', product.getLatest);
app.get('/api/products/:id', product.getLatestByBrand);
app.post('/api/review/create', review.createReview);

// serve the index.html
app.use('/', express.static(__dirname + '/'));
app.get('/*', function (req, res) {
  res.sendFile('views/index.html', {
    root: './public'
  });
});

// catch 404 and forward to error handler
app.use((req, res, next) => {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

module.exports = app;
