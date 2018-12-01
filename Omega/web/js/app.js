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
                when('/signIn', {
                    templateUrl: 'app/signIn.html',
                    controller: 'signInCtrl'
                }).
                when('/signUp', {
                    templateUrl: 'app/signUp.html',
                    controller: 'signUpCtrl'
                }).
                when('/inventory', {
                    templateUrl: 'app/inventory.html',
                    controller: 'inventoryCtrl'
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
    $rootScope.currentPage = "/";
    
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
        if(path != "/signIn" && path != "/signUp")
            $rootScope.currentPage = path;
        
        $location.path(path);
    }
});

omegaApp.controller('omegaCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.isAdmin = false;
    $scope.signIn = function()
    {
        $rootScope.navigate('/signIn');
    };
    
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
    };

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

omegaApp.controller('signInCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/signIn")
            .success().error(function(data){    
            });
    $scope.executeLogin = function(login) {
        $http.post($rootScope.httpUrl + "/api/login", login)  
            .success(function(data){
                $rootScope.userInfo = data;
                if($rootScope.userInfo.isAdmin){
                    $rootScope.navigate('/dashboard');
                }
                else{
                    $rootScope.navigate($rootScope.currentPage);
                }

            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            })
  
        };
    $scope.signUp = function()
    {
        $rootScope.navigate('/signUp');
    };
});

omegaApp.controller('signUpCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $scope.addUser = function(login){
        $http.post($rootScope.httpUrl + "/api/signUp", login)  
            .success(function(data){
                $rootScope.navigate($rootScope.currentPage);

            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            }) 
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
     $scope.getCheckout = function(productId)
     {
       if($rootScope.userInfo != null){
           $rootScope.productId = productId;
       $rootScope.navigate('/checkout');
       }
       else{
          $rootScope.navigate('/signIn'); 
       }
     };
});

omegaApp.controller('checkoutCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/productdetails/" + $rootScope.orderId + "/checkout")
            .success().error(function(data){    
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


omegaApp.controller('inventoryCtrl', function ($scope, $rootScope, $http, 
    $routeParams)
{
    $scope.fetchProducts = function(manId, outOfStk)
    {
        if(outOfStk == null)
            outOfStk = false;
        $rootScope.showDanger = false;
        $http.get($rootScope.httpUrl + "/api/manufacturer/" + manId 
                + "/products?outOfStock=" + outOfStk)
            .success(function(data){
                $scope.products = data.data;
            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            });
    }
    
    $rootScope.resetDialogs();
    $http.get($rootScope.httpUrl + "/api/manufacturers")
            .success(function(data){
                $scope.manufacturers = data.data;
                if($scope.manufacturers.length > 0) {
                    $scope.manId = $scope.manufacturers[0].id;
                    $scope.fetchProducts($scope.manId, false);
                }
            }).error(function(data){
                $rootScope.showDanger = true;
                $rootScope.dangerMsg = data.message;
            });
       
    $scope.showDialog = function(product)
    {
        $scope.selectedProduct = product;
        $scope.quantity = product.quantity;
        $("#ivModal").modal("show");
    }
    
    $scope.saveQuantity = function(quantity)
    {
        $rootScope.resetDialogs();
        $http.put($rootScope.httpUrl + "/api/product/" + $scope.selectedProduct.id
                + "/quantity/" + quantity)
                .success(function(data){
                    $("#ivModal").modal("hide");
                    $rootScope.showSuccess = true;
                    $rootScope.successMsg = "Quantity of " 
                        + $scope.selectedProduct.productName + " updated successfuly!";
                    $scope.fetchProducts($scope.manId, $scope.outOfStk);
                }).error(function(data){
                    $rootScope.showDanger = true;
                    $rootScope.dangerMsg = data.message;
                });
    }
});
