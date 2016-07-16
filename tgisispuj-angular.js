var api_url = 'http://tgisispuj-be-fabka.c9users.io/api/';
var app = angular.module('tgisispuj', []);
app.controller('tgisispujController', function($scope, $http) {
    
    var modalidad_seleccionada = '';
    
    $http.get(api_url+'modalidades')
        .then(function (response) {
            $scope.opciones_modalidad = response.data;
        });
    $scope.showSelectValue = function( seleccionada_modalidad ){
        $scope.seleccionada_modalidad = seleccionada_modalidad.nombre;
        console.log($scope.seleccionada_modalidad);
    }
    
    $scope.buscar = function(){
        var url = 'https://tgisispuj-be-fabka.c9users.io/api/busqueda?general='+$scope.general+'&modalidad='+$scope.seleccionada_modalidad+'&grupoInvestigacion='+$scope.grupoInvestigacion+'&mencionHonor='+$scope.mencionHonor+'&anio='+$scope.anio+'&semestre='
		    +$scope.periodo+'&tituloAplicado='+$scope.tituloAplicado;
    	console.log(url);
        $http.get(url)
        .then(function (response) {
            console.log(response);
        });
    }
    
    
    $scope.busqueda = function(){
        var url = 'https://tgisispuj-be-fabka.c9users.io/api/busqueda?general='+$scope.general+'&modalidad='+$scope.modalidad+'&grupoInvestigacion='+$scope.grupoInvestigacion+'&mencionHonor='+$scope.mencionHonor+'&anio='+$scope.anio+'&semestre='
		    +$scope.periodo+'&tituloAplicado='+$scope.tituloAplicado;
    	console.log(url);
        $http.get(url)
        .then(function (response) {
            console.log(response);
        });
    }
    
    var url = '/api';
    $http.get(url)
    .then(function (response) {
        //console.log(response);
    });
    
    
    $http.get(api_url+'modalidades')
        .then(function (response) {
            $scope.opciones_modalidad = response.data;
        });
    
    
        
    console.log($scope.selecccionada_modalidad);
});
