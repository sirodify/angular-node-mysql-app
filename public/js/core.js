var myApp = angular.module('myApp', ['ui.bootstrap', 'ngRoute', 'ngCookies']);

// global
// assume the customer with user id '1' is login
var userId = '1';

// configure our routes
myApp.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $locationProvider.hashPrefix('');
  $routeProvider
    .when('/', {
      templateUrl: '/views/products.html',
      controller: 'mainController'
    })
    .when('/brand/:id', {
      templateUrl: 'views/brand.html',
      controller: 'brandController'
    })
    .when('/review/:id', {
      templateUrl: '/views/review.html',
      controller: 'reviewController'
    })
    .otherwise({
      redirectTo: '/'
    });
}]);

myApp.controller('mainController', function($scope, $http, $cookies) {
  // when landing on the page, get all products and show them
  $http.get('/api/products')
    .then(function(res) {
      $scope.products = res.data;
    })
    .catch(function(error) {
      console.log('Error: ' + error);
    });

  $scope.saveProdName = function(prodName) {
    console.log(prodName);
    $cookies.put("productName", prodName);
  };
});

myApp.controller('brandController', function($scope, $routeParams, $http, $cookies) {
  $http.get('/api/products/' + $routeParams.id)
    .then(function(res) {
      $scope.products = res.data;
    })
    .catch(function(error) {
      console.log('Error: ' + error);
    });

  $scope.saveProdName = function(prodName) {
    console.log(prodName);
    $cookies.put("productName", prodName);
  };
});

myApp.controller('reviewController', function($scope, $routeParams, $http, $location, $cookies) {
  $scope.productName = $cookies.get('productName');
  $scope.reviewData = {};

  $scope.saveReview = function() {
    // form data validation
    $scope.emailRequired = '';
    $scope.ratingRequired = '';
    $scope.commentRequired = '';

    if (!$scope.reviewData.email) {
      $scope.emailRequired = 'Email is Required';
    }
    if (!$scope.reviewData.rating) {
      $scope.ratingRequired = 'Rating is Required';
    }
    if (!$scope.reviewData.comment) {
      $scope.commentRequired = 'Comment is Required';
    }
    $scope.reviewData.userId = userId;
    $scope.reviewData.productId = $routeParams.id;

    $http.post('/api/review/create', $scope.reviewData)
      .then(function(res) {
        $scope.reviewData = {};
        $location.path('#/');
      })
      .catch(function(res) {
        console.log('Error: ' + res.data);
      });
  };

});