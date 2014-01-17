/**
 * Created by slava on 1/4/14.
 */
function HelloCntl($scope) {
    $scope.name = 'World';
}

var bandProfileApp = angular.module('bandProfileApp', ["ngRoute", "testControllers"]);

bandProfileApp.config(["$routeProvider", function($routeProvider){
    $routeProvider.
        when('/add/:id', {
            templateUrl: '/assets/templates/add-user.html',
            controller: 'AddUserController'
        }).
        when('/home', {
            templateUrl: '/assets/templates/hello-world.html',
            controller: 'BandController'
        }).
        otherwise({
            redirectTo: '/'
        })
}]);

