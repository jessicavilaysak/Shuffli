/*global angular*/
var shuffliApp = angular.module("shuffli", ['ngRoute']);

shuffliApp.controller('mainController', function ($scope) {});

shuffliApp.controller('loginController', function ($scope, $location,$timeout) {
	var loginDelay = function() {
		$location.path('/dashboard');
	}
	
	$scope.loggingIn = false;
	$scope.submitLogin = function () {
		$scope.loggingIn = true;
		$timeout(loginDelay, 2500);
	};
});

shuffliApp.controller('dashboardController', function ($scope) {
	$("body").css("background-color", "rgba(211, 211, 211, 0.35)");
	$("body").css("background-image", "none");
});
