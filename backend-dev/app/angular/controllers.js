/*global angular*/
var shuffliApp = angular.module("shuffli", ['ngRoute', 'ui.bootstrap', 'ngStorage']);

shuffliApp.controller('mainController', function ($scope, $location) {


	$scope.showNavbar = function () {
		var path = $location.path();

		if (path == '/login' || path == '/signup' || path == '/accountsetup' || path == '/paymentsetup') {
			return false;
		}
		return true;
	};
});

shuffliApp.controller('paymentSetupController', function ($scope, $location) {
	$scope.startSubscription = function () {
		bootbox.alert("Payment was successful, you will now be taken to the dashboard!", function () {
			$location.path('/dashboard');
			$scope.$apply();
		});
	}
});

shuffliApp.controller('setupController', function ($scope, $location) {
	$scope.categories = [];
	$scope.creators = [];
	$scope.creatorEntry = [{}];

	$scope.makePayment = function () {
		$location.path('/paymentsetup');
	}

	$scope.addCreator = function () {
		$scope.creators.push($scope.creatorEntry);

		//clear the category field
		$scope.creatorEntry = [{}];
	}

	$scope.removeCreator = function (creator) {
		$scope.creators.splice($scope.creators.indexOf(creator), 1);
	}

	$scope.addCategory = function (category) {
		$scope.categories.push(category);

		//clear the category field
		$scope.categoryEntry = '';
	}

	$scope.removeCategory = function (category) {
		$scope.categories.splice($scope.categories.indexOf(category), 1);
	}
});

shuffliApp.controller('signupController', function ($scope, $location) {
	$scope.accountSetup = function () {
		$location.path('/accountsetup');
	}
});

shuffliApp.controller('loginController', function ($scope, $location, $timeout) {
	var loginDelay = function () {
		$location.path('/dashboard');
	}

	$scope.loggingIn = false;
	$scope.submitLogin = function () {
		$scope.loggingIn = true;
		$timeout(loginDelay, 2500);
	};
});

shuffliApp.controller('creatorsController', function ($scope, $location, $timeout) {
	$scope.creators = [
		{
			"publisherId": "010102",
			"publisherName": "Marketing",
			"publisherImageURL": "marketing.png"
		},
		{
			"publisherId": "024024",
			"publisherName": "Coffee Club",
			"publisherImageURL": "coffeeclub.jpg"
		},
		{
			"publisherId": "024222",
			"publisherName": "Flight Centre",
			"publisherImageURL": "flightcentre.jpg"
		},
		{
			"publisherId": "248024",
			"publisherName": "Bag Shop",
			"publisherImageURL": "bagshop.jpg"
		}
    ];
});

shuffliApp.controller('archiveController', function ($scope, $location, $sessionStorage) {
	$scope.$storage = $sessionStorage;

	if (typeof $scope.$storage.archivedPosts == 'undefined') {
		$scope.$storage.archivedPosts = [
			{
				"id": "000008",
				"creator": "Marketing",
				"daysLeft": 45,
				"creatorName": "Anonymous",
				"creatorImageURL": "marketing.png",
				"description": "Luxury apartment suites at the Maxtra Hotel",
				"imageURL": "images/posts/8.jpg"
		},
			{
				"id": "000005",
				"creator": "Coffee Club",
				"daysLeft": 12,
				"creatorName": "Alice Gregory",
				"creatorImageURL": "coffeeclub.jpg",
				"description": "New beans with exquisite flavours have arrived!",
				"imageURL": "images/posts/5.jpg"
		},
			{
				"id": "000006",
				"creator": "Flight Centre",
				"daysLeft": 22,
				"creatorName": "Fred Flowerpot",
				"creatorImageURL": "flightcentre.jpg",
				"description": "Cheap flights to and from Hong Kong for a limited time.",
				"imageURL": "images/posts/6.jpg"
		},
			{
				"id": "000007",
				"creator": "Bag Shop",
				"daysLeft": 32,
				"creatorName": "Jayden Wood",
				"creatorImageURL": "bagshop.jpg",
				"description": "New woman shoulder bags now available!",
				"imageURL": "images/posts/7.jpg"
		}
	];
	}

	$scope.unarchivePost = function (post) {
		var dashboardPost = JSON.parse(JSON.stringify(post));
		//add to the dashboard posts array
		$scope.$storage.posts.push(dashboardPost);
		//delete the post from posts array
		$scope.$storage.archivedPosts.splice($scope.$storage.archivedPosts.indexOf(post), 1);
		$scope.$apply();
	}

	$scope.unarchivePostButton = function (post) {
		bootbox.confirm({
			title: "Unarchive Post ID: " + post.id,
			message: "Are you sure you want to put this post back onto the dashboard?",
			buttons: {
				cancel: {
					label: '<i class="fa fa-times"></i> Cancel'
				},
				confirm: {
					label: '<i class="fa fa-check"></i> Confirm'
				}
			},
			callback: function (result) {
				if (result) {
					$scope.unarchivePost(post);
				}
				console.log(result);
			}
		});
	};
});

shuffliApp.controller('dashboardController', function ($scope, $uibModal, $log, $sessionStorage) {
	$scope.$storage = $sessionStorage;

	console.log($scope.$storage.posts);

	//set default posts if new session
	if (typeof $scope.$storage.posts == 'undefined') {
		$scope.$storage.posts = [
			{
				"id": "000001",
				"creator": "Marketing",
				"creatorName": "Anonymous",
				"creatorImageURL": "marketing.png",
				"description": "Social media is evolving like never before",
				"imageURL": "images/posts/1.jpg"
		},
			{
				"id": "000002",
				"creator": "Coffee Club",
				"creatorName": "John Doe",
				"creatorImageURL": "coffeeclub.jpg",
				"description": "Have you tried the worlds greatest coffee?",
				"imageURL": "images/posts/2.jpg"
		},
			{
				"id": "000003",
				"creator": "Flight Centre",
				"creatorName": "Bob Howe",
				"creatorImageURL": "flightcentre.jpg",
				"description": "Get away from reality with Flight Centre.",
				"imageURL": "images/posts/3.jpg"
		},
			{
				"id": "000004",
				"creator": "Bag Shop",
				"creatorName": "Jane Doe",
				"creatorImageURL": "bagshop.jpg",
				"description": "Check out our new bag range that have just arrived!",
				"imageURL": "images/posts/4.jpg"
		}
	];
	}



	$scope.modalAnimationsEnabled = true;

	$scope.postToApprove = null;

	$scope.facebookPages = [
		"Eastland Main",
		"Eastland Fashion",
		"Eastland Food"
	];

	$scope.pinterestBoards = [
		"Eastland Main",
		"Eastland Fashion",
		"Eastland Food"
	];

	$scope.approvePostButton = function (postData) {
		$scope.postToApprove = postData;
		$("#approvePostModal").modal()
	};

	$scope.makePost = function (post) {
		$('#approvePostModal').modal('toggle');
		//remove post from dashboard
		$scope.$storage.posts.splice($scope.$storage.posts.indexOf(post), 1);

		bootbox.alert("Post was approved and posted!");
	}

	$scope.archivePost = function (post) {
		//make a deep copy
		var archivePost = JSON.parse(JSON.stringify(post));
		//set expiry
		archivePost.daysLeft = 90;

		//delete the post from posts array
		$scope.$storage.posts.splice($scope.$storage.posts.indexOf(post), 1);

		$scope.$storage.archivedPosts.push(archivePost);

		$scope.$apply();
	}

	$scope.archivePostButton = function (post) {
		bootbox.confirm({
			title: "Archive Post ID: " + post.id,
			message: "Are you sure you want to archive this post for 90 days?",
			buttons: {
				cancel: {
					label: '<i class="fa fa-times"></i> Cancel'
				},
				confirm: {
					label: '<i class="fa fa-check"></i> Confirm'
				}
			},
			callback: function (result) {
				if (result) {
					$scope.archivePost(post);
				}
				console.log(result);
			}
		});
	}
});
