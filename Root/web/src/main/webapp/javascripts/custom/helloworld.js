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
        otherwise({
            redirectTo: '/'
        })
}]);

