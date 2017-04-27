/*global angular*/
var shuffliApp = angular.module("shuffli", ['ngRoute']);

shuffliApp.controller('mainController', function ($scope) {
});

shuffliApp.controller('loginController', function ($scope) {
	$scope.loggingIn = false;
	$scope.submitLogin = function () {
		$scope.loggingIn = true;
	};
});
