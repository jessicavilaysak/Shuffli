/*global angular*/
var shuffliApp = angular.module("shuffli", ['ngRoute', 'ui.bootstrap']);

shuffliApp.controller('mainController', function ($scope, $location) {
    
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

shuffliApp.controller('publisherController', function ($scope, $location, $timeout) {
	$scope.publishers = [
        {"publisherId": "010102", "publisherName": "Marketing", "publisherImageURL": "marketing.png"},
        {"publisherId": "024024", "publisherName": "Coffee Club", "publisherImageURL": "coffeeclub.jpg"},
        {"publisherId": "024222", "publisherName": "Flight Centre", "publisherImageURL": "flightcentre.jpg"},
        {"publisherId": "248024", "publisherName": "Bag Shop", "publisherImageURL": "bagshop.jpg"}
    ];
});

shuffliApp.controller('dashboardController', function ($scope, $uibModal, $log) {
	$scope.posts = [
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

	$scope.modalAnimationsEnabled = true;

	$scope.postToApprove = null;

	$scope.approvePostToFacebook = 1;
	$scope.approvePostToPinterest = 0;


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

	$scope.archivePost = function (post) {
		console.log("archiving post.... " + post.id);
		console.log($scope.posts);
		//delete the post from posts array
		$scope.posts.splice($scope.posts.indexOf(post), 1);
		console.log($scope.posts);
		console.log("archiving post after.... " + post.id);
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
