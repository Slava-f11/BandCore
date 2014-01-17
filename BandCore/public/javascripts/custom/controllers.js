var testControllers = angular.module("testControllers", []);

testControllers.controller('HelloCntl', function($scope){
    $scope.name = 'World'
});

testControllers.controller('BandController', function($scope, $http){

    $http.get("/getData").success(function(data){
        $scope.name = data;
    });
    $scope.stuff = [
        {'name': 'Slava'},
        {'name': 'Dima'}
    ];
    $scope.query = 'SL'
});

testControllers.controller('AddUserController', function($scope, $routeParams){
    $scope.title = "Add user!" + $routeParams.id

    $scope.setTitle = function(title){
        $scope.title = title;
    }
});