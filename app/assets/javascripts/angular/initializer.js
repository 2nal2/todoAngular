//= require angular
//= require angular/angularMain

function bootstrapAngular() {
    console.log("bootstraping angularjs");
    angular.bootstrap(document.body, ["hisab"]);
};
$(document).on('turbolinks:load', bootstrapAngular);