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
                when('/devices', {
                    templateUrl: 'app/devices.html'
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
    $rootScope.showSuccess = false;
    $rootScope.showInfo = false;
    $rootScope.showWarn = false;
    $rootScope.showDanger = false;
});

omegaApp.controller('omegaCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    
});

omegaApp.controller('homeCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $http.get($rootScope.httpUrl + "/api/manufacturers")
            .success(function(data){
                $scope.manufacturers = data.data;
            }).error(function(data){
                
            });
});