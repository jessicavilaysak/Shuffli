//Route Configuration
shuffliApp.config(function ($routeProvider,$locationProvider) {
	$locationProvider.hashPrefix('');
	$routeProvider
	.when('/', {
		templateUrl: 'views/loginView.html',
		controller: 'loginController'
	})
	.when('/dashboard', {
		templateUrl: 'views/dashboardView.html',
		controller: 'dashboardController'
	})
    .when('/publishers', {
		templateUrl: 'views/publishersView.html',
		controller: 'publisherController'
	})
	.when('/login', {
		templateUrl: 'views/loginView.html',
		controller: 'loginController'
	})
	.when('/register', {
		templateUrl: 'views/settingsView.html',
		controller: 'settingsController'
	});
});