/**
 * Created by slava on 1/4/14.
 */
function HelloCntl($scope) {
    $scope.name = 'World';
}

var bandProfileApp = angular.module('bandProfileApp', ["ngRoute", "testControllers", "filtersApp", "testServices"]);

bandProfileApp.config(["$routeProvider", function($routeProvider){
    $routeProvider.
        when('/add/:id', {
            templateUrl: '/web/templates/add-user.html',
            controller: 'AddUserController'
        }).
        when('/home', {
            templateUrl: '/web/templates/hello-world.html',
            controller: 'BandController'
        }).
        when('/login', {
            templates: {
                layout: 'secondNav.html', content: 'login.html'
            },
            controller: 'AppController'
        }).
        otherwise({
            redirectTo: '/'
        })
}]);

//bandProfileApp.controller('AppController', function($scope){
//    $scope.template = {layout: 'secondNav.html', content: 'login.html'}
//});

bandProfileApp.controller('AppController', ['$rootScope','$route', '$location','$controller', function ($rootScope,$route,$location,$controller) {

    $rootScope.$on('$routeChangeSuccess', function(scope, newRoute){
        if (!newRoute) return;
        //Load any required resources here
        console.log("Do conditional loading here");
        //Set the state bound do the ng-include src attribute
        $rootScope.template = newRoute.$$route.templates;
    });
}]);

