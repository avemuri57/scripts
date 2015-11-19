#!/bin/bash

mkdir app
mkdir config
mkdir public
mkdir app/models
mkdir public/css
mkdir public/js
mkdir public/js/controllers
mkdir public/img
mkdir public/views

#make the package.json file with bare dependencies

text='    {
      "name": "Anand",\n
      "main": "server.js",\n
      "dependencies": {\n
        "express" : "~4.5.1",\n
        "mongoose" : "~3.8.0",\n
        "body-parser" : "~1.4.2",\n
        "method-override" : "~2.0.2"  \n      
      }\n
    }'

bower='{
  "name": "Starter-App",\n
  "version": "1.0.0",\n
  "dependencies": {\n
    "bootstrap": "latest",\n
    "font-awesome": "latest",\n
    "animate.css": "latest",\n
    "angular": "latest",\n
    "angular-route": "latest",\n
    "angular-cookies": "latest" \n  
  }\n
}
  '

bowerrc='{\n\n
  
"directory":"public/libs"\n\n

}'

server='var express        = require("express");\n
var app            = express();\n
var bodyParser     = require("body-parser");\n
var methodOverride = require("method-override");\n
var port = 8007; \n
app.use(bodyParser.json()); \n
app.use(bodyParser.json({ type: "application/vnd.api+json" })); \n
app.use(bodyParser.urlencoded({ extended: true })); \n
app.use(methodOverride("X-HTTP-Method-Override")); \n
app.use(express.static(__dirname + "/public")); \n
require("./app/routes")(app); \n
app.listen(port);\n                    
console.log("Magic happens on port " + port);\n      
exports = module.exports = app;\n'  

routes='module.exports = function(app) {\n
        app.get("*", function(req, res) {\n
            res.sendfile("./public/views/index.html");\n
        });\n
    };\n'
index='<!doctype html>\n
 <html lang="en">\n
 <head>\n
  <meta charset="UTF-8">\n
  <link rel="stylesheet" href="libs/bootstrap/dist/css/bootstrap.min.css">\n
  <script src="libs/angular/angular.min.js"></script>\n
  <script src="libs/angular-route/angular-route.min.js"></script>\n
  <script src="libs/angular-cookies/angular-cookies.min.js"></script>\n
  <script src="js/controllers/MainCtrl.js"></script>\n
  <script src="js/controllers/MainCtrl.js"></script>\n
    <script src="js/appRoutes.js"></script>\n
  <script src="js/app.js"></script>\n
   <base href="/">\n
  <title>Anands JS App</title>\n
 </head>\n
<body ng-app="App" ng-controller="MainController">\n
 <div ng-view></div>\n
</body>\n
 </html>'
 home='<div>\n
    <h1>Welcome to Vemuri Enterprises</h1>\n
</div>'
app='angular.module("App", [ "ngRoute","MainCtrl","appRoutes","ngCookies"]);'
appRoutes='angular.module("appRoutes", []).config(["$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {\n\n

  $routeProvider\n\n

    // home page\n
    .when("/", {\n
      templateUrl: "views/home.html",\n
      controller: "MainController"\n
    })\n\n
  
  $locationProvider.html5Mode(true);\n\n

}]);'

mainctrl='angular.module("MainCtrl", ["ngCookies"]).controller("MainController",["$scope","$http", function($scope,$http) {\n\n

  $scope.tagline = "Have Fun Hacking Away!"; \n\n

}]);'
echo $bower >>bower.json
echo $bowerrc>>.bowerrc
echo $text >>package.json
echo $server >>server.js
echo $routes >>./app/routes.js
echo $index >>public/views/index.html
echo $app>>public/js/app.js
echo $appRoutes>>public/js/appRoutes.js
echo $home>>public/views/home.html
echo $mainctrl> public/js/controllers/MainCtrl.js


npm install
bower install
nodemon server.js


