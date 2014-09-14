TodoApp = angular.module "TodoApp", ["ngRoute", "templates"]

TodoApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->

  $routeProvider
    .when "/",
      templateUrl: "index.html",
      controller: "TodoCtrl"
  .otherwise
    redirectTo: "/"

  $locationProvider.html5Mode(true)

]

TodoApp.controller "TodoCtrl", ["$scope", "$http", ($scope, $http) ->

  $scope.tasks = [{text: "Test task", done: false}]
]