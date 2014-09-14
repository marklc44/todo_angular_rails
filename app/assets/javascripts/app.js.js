// Generated by CoffeeScript 1.8.0
var TodoApp;

TodoApp = angular.module("TodoApp", ["ngRoute", "templates"]);

TodoApp.config([
  "$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {
    $routeProvider.when("/", {
      templateUrl: "index.html",
      controller: "TodoCtrl"
    }).otherwise({
      redirectTo: "/"
    });
    return $locationProvider.html5Mode(true);
  }
]);

TodoApp.controller("TodoCtrl", [
  "$scope", "$http", function($scope, $http) {
    $scope.tasks = [];
    $scope.allTasks = function() {
      return $http.get('/tasks.json').success(function(data) {
        return $scope.tasks = data;
      });
    };
    $scope.allTasks();
    $scope.addTask = function(task) {
      return $http.post('/tasks.json', $scope.task).success(function(data) {
        $scope.task = {};
        $scope.tasks.unshift(data);
        return console.log(data);
      });
    };
    return $scope.deleteTask = function(task) {
      var confirmDelete;
      confirmDelete = confirm("Are you sure you want to delete this task?");
      if (confirmDelete) {
        return $http["delete"]("/tasks/" + task.id + ".json").success(function(data) {
          console.log("task deleted: ", data);
          return $scope.tasks.splice($scope.tasks.indexOf(task), 1);
        });
      }
    };
  }
]);
