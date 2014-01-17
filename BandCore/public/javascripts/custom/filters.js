/**
 * Created by slava on 1/17/14.
 */
var filtersApp = angular.module("filtersApp", []);

filtersApp.filter("testFilter", function(){
    return function(input){
        if (input == "Slava")
            return "Y";
        else
            return "No";
    }
});