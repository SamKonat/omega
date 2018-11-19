var omegaApp = angular.module("omegaApp", ["ngRoute", "ngCookies",
    "ui.bootstrap", "checklist-model", "ngAnimate"]);

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
                $scope.devices = data.data;
            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            });
});