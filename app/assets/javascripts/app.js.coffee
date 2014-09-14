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

  $scope.tasks = []

  $scope.allTasks = ->
    $http.get('/tasks.json').success (data) ->
      $scope.tasks = data

  $scope.allTasks()

  $scope.addTask = (task) ->
    $http.post('/tasks.json', $scope.task).success (data) ->
      $scope.task = {}
      $scope.tasks.unshift(data)
      console.log(data)

  $scope.deleteTask = (task) ->
    confirmDelete = confirm "Are you sure you want to delete this task?"
    if confirmDelete
      $http.delete("/tasks/#{task.id}.json").success (data) ->
        console.log("task deleted: ", data)
        $scope.tasks.splice($scope.tasks.indexOf(task), 1)
]