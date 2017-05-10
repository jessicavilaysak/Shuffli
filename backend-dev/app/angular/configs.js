//Route Configuration
shuffliApp.config(function ($routeProvider, $locationProvider) {
	$locationProvider.hashPrefix('');
	$routeProvider
		.when('/dashboard', {
			templateUrl: 'views/dashboardView.html',
			controller: 'dashboardController'
		})
		.when('/archived', {
			templateUrl: 'views/archiveView.html',
			controller: 'archiveController'
		})
		.when('/creators', {
			templateUrl: 'views/creatorsView.html',
			controller: 'creatorsController'
		})
		.when('/login', {
			templateUrl: 'views/loginView.html',
			controller: 'loginController'
		})
		.when('/accountsetup', {
			templateUrl: 'views/setupView.html',
			controller: 'setupController'
		})
		.when('/paymentsetup', {
			templateUrl: 'views/paymentSetupView.html',
			controller: 'paymentSetupController'
		})
		.when('/signup', {
			templateUrl: 'views/signupView.html',
			controller: 'signupController'
		}).otherwise({
			redirectTo: "/signup"
		});
});
