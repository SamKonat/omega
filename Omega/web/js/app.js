var omegaApp = angular.module("omegaApp", ["ngRoute", "ngCookies",
    "ui.bootstrap", "checklist-model", "ngAnimate"]);

omegaApp.config(['$routeProvider', '$httpProvider',
    function ($routeProvider) {
        $routeProvider.
                when('/', {
                    templateUrl: 'app/home.html'
                }).
                when('/home', {
                    templateUrl: 'app/home.html'
                }).      
                otherwise({
                    redirectTo: '/'
                });
    }]);

omegaApp.run(function ($rootScope,$filter, $route, $http, $cookies, 
    $location, $window)
{
    
});

omegaApp.controller('omegaCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    
});