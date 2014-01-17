/**
 * Created by slava on 1/17/14.
 */
var testServices = angular.module("testServices", ['ngResource']);

testServices.factory("Stuff", ['$resource', function($resource){
    return $resource('getData', {}, {
        query: {method: 'GET'}
    })
}]);