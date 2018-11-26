var omegaApp = angular.module("omegaApp", ["ngRoute", "ngCookies",
    "ui.bootstrap", "checklist-model", "ngAnimate", "chartjs"]);

omegaApp.config(['$routeProvider', '$httpProvider',
    function ($routeProvider) {
        $routeProvider.
                when('/', {
                    templateUrl: 'app/home.html',
                    controller: 'homeCtrl'
                }).
                when('/home', {
                    templateUrl: 'app/home.html',
                    controller: 'homeCtrl'
                }). 
                when('/products', {
                    templateUrl: 'app/products.html',
                    controller: 'productsCtrl'
                }).  
                when('/productdetails', {
                    templateUrl: 'app/productDetails.html',
                    controller: 'productdetailsCtrl'
                }).
                when('/checkout', {
                    templateUrl: 'app/checkout.html',
                    controller: 'checkoutCtrl'
                }).
                when('/dashboard', {
                    templateUrl: 'app/dashboard.html',
                    controller: 'dashboardCtrl'
                }).
                otherwise({
                    redirectTo: '/'
                });
    }]);

omegaApp.run(function ($rootScope,$filter, $route, $http, $cookies, 
    $location, $window)
{
    $rootScope.siteName = "Just Buy";
    $rootScope.httpUrl = "http://localhost:8080/omega";
    
    $rootScope.resetDialogs = function()
    {
        $rootScope.showSuccess = false;
        $rootScope.showInfo = false;
        $rootScope.showWarn = false;
        $rootScope.showDanger = false;
    }
    $rootScope.resetDialogs();
    
    $rootScope.navigate = function(path)
    {
        $location.path(path);
    }
});

omegaApp.controller('omegaCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    
});

omegaApp.controller('homeCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/manufacturers")
            .success(function(data){
                $scope.manufacturers = data.data;
            }).error(function(data){
                
            });
            
    $scope.getPhones = function(manId)
    {
        $rootScope.manufacturerId = manId;
        $rootScope.navigate('/products');
    }
});

omegaApp.controller('productsCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/manufacturer/" + $rootScope.manufacturerId + "/products")
            .success(function(data){
                $scope.products = data.data;
            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            });
    $scope.getDetails = function(prodId)
    {
        $rootScope.productId = prodId;
        $rootScope.navigate('/productdetails');
    };
});

omegaApp.controller('productdetailsCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/products/" + $rootScope.productId + "/productdetails")
            .success(function(data){
                $scope.productdetails = data.data;
            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            });
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/products/" + $rootScope.productId + "/reviews")
            .success(function(data){
                $scope.reviews = data.data;
            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            });
     $scope.getCheckout = function(orderId)
     {
       $rootScope.orderId = orderId;
       $rootScope.navigate('/checkout');
     };
});
omegaApp.controller('checkoutCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/productdetails/" + $rootScope.orderId + "/checkout")
            .success(function(data){
                $scope.checkout = data.data;
            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            });
});

omegaApp.controller('dashboardCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $scope.colors = [
        {"code": "#4D5360", "name": "DarkGrey"},
        {"code": "#4285F4", "name": "Blue"},
        {"code": "#FDB45C", "name": "Yellow"},
        {"code": "#63E2C6", "name": "Green"},
        {"code": "#F7464A", "name": "Red"},
        {"code": "#DE8E40", "name": "Orange"},
        {"code": "#C0FBCA", "name": "LightGreen"},
        {"code": "#A90D0E", "name": "DarkRed"},
        {"code": "#A687AA", "name": "Lilac"},
        {"code": "#6C464E", "name": "Tuscan"}
    ]; 
    
    $http.get($rootScope.httpUrl + "/api/topBrands")
            .success(function(data){
                $scope.pieData1 = data;
            }).error(function(data){
                
            });
    
    $scope.lineData = 
    {};
    
    $http.get($rootScope.httpUrl + "/api/salesTrend")
            .success(function(data){
                $scope.lineData = data;
            }).error(function(data){
                
            });
    
    $scope.lineDataX = 
    {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"],
        datasets: [
            {
                label : "Motorola",
                fillColor: "rgba(0,0,0,0.1)",
                strokeColor: "#4285F4",
                pointColor: "#4285F4",
                pointStrokeColor: "rgba(128,128,128,1.0)",
                pointHighlightFill: "rgba(128,128,128,1.0)",
                pointHighlightStroke: "",
                data: [5, 15, 28, 30, 35, 45, 79, 108]
            },{
                label : "Nokia",
                fillColor: "rgba(0,0,0,0.1)",
                strokeColor: "#F7464A",
                pointColor: "#F7464A",
                pointStrokeColor: "rgba(128,128,128,1.0)",
                pointHighlightFill: "rgba(128,128,128,1.0)",
                data: [24, 30, 16, 26, 39, 49, 80, 103]
            },{
                label : "Apple",
                fillColor: "rgba(0,0,0,0.1)",
                strokeColor: "#FDB45C",
                pointColor: "#FDB45C",
                pointStrokeColor: "rgba(128,128,128,1.0)",
                pointHighlightFill: "rgba(128,128,128,1.0)",
                data: [16, 30, 33, 20, 28, 30, 60, 119]
            }]
    };
    
    $scope.pieData2 = [{
            value: 2,
            color : "#4285F4",
            label : "Philadelphia"
    },{
            value: 5,
            color : "#F7464A",
            label : "Pittsburgh"
    },{
            value: 8,
            color : "#FDB45C",
            label : "New York"
    },{
            value: 8,
            color : "#4D5360",
            label : "Ohio"
    },{
            value: 8,
            color : "#DE8E40",
            label : "D.C."
    },{
            value: 8,
            color : "#A90D0E",
            label : "Apple"
    }];

});