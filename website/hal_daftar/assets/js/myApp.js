angular.module('myApp', ['ngAnimate']);

angular.module('myApp')
.controller('myController', function ($scope) {
  
  $scope.inventory = [
    { id :  1, category : "All New Avanza",     description : "Mobil+Driver",   price :  350000, qty : 1 },
    { id :  2, category : "All New Avanza",     description : "Tanpa Driver",   price :  300000, qty : 1 },
    { id :  3, category : "Grand Xenia",        description : "Mobil+Driver",   price :  350000, qty : 1 },
    { id :  4, category : "Grand Xenia",        description : "Tanpa Driver",   price :  300000, qty : 1 },
    { id :  5, category : "Daihatsu Ayla",      description : "Mobil+Driver",   price :  300000, qty : 1 },
    { id :  6, category : "Daihatsu Ayla",      description : "Tanpa Driver",   price :  300000, qty : 1 },
    { id :  7, category : "Honda CRV",          description : "Mobil+Driver",   price :  400000, qty : 1 },
    { id :  8, category : "Honda CRV",          description : "Tanpa Driver",   price :  300000, qty : 1 },
    { id :  9, category : "Daihatsu Sigra",     description : "Mobil+Driver",   price :  300000, qty : 1 },
    { id :  10, category : "Daihatsu Sigra",    description : "Tanpa Driver",   price :  300000, qty : 1 },
    { id :  11, category : "Suzuki APV",        description : "Mobil+Driver",   price :  300000, qty : 1 },
    { id :  12, category : "Suzuki APV",        description : "Tanpa Driver",   price :  300000, qty : 1 },
    { id :  13, category : "Suzuki VARIO",        description : "Sendiri",   price :  3000000, qty : 1 },
   
  ];
  
  $scope.cart = [];
  
  var findItemById = function(items, id) {
    return _.find(items, function(item) {
      return item.id === id;
    });
  };
  
  $scope.getCost = function(item) {
    return item.qty * item.price;
  };

  $scope.addItem = function(itemToAdd) {
    var found = findItemById($scope.cart, itemToAdd.id);
    if (found) {
      found.qty += itemToAdd.qty;
    }
    else {
      $scope.cart.push(angular.copy(itemToAdd));}
  };
  
  $scope.getTotal = function() {
    var total =  _.reduce($scope.cart, function(sum, item) {
      return sum + $scope.getCost(item);
    }, 0);
    console.log('total: ' + total);
    return total;
  };
  
  $scope.clearCart = function() {
    $scope.cart.length = 0;
  };
  
  $scope.removeItem = function(item) {
    var index = $scope.cart.indexOf(item);
    $scope.cart.splice(index, 1);
  };
  
});
