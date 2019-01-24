hisab.controller('customerAdminController', ['$scope', 'customerAdminFactory', "countryFactory", function ($scope, customerAdminFactory, countryFactory) {
    $scope.customer = {
        status: true,
        type_customer: "N",
        interest_rate: 0,
        credit_limit: 0,
        credit_time_limit:0
    };

    function enableButtonCommit(){
        setTimeout(function () {
            document.getElementsByName("commit").forEach(function(e){
                console.log(e);
                e.disabled = false;
            });
        }, 100);
    }

    $scope.loadProvinces = function(){
        countryFactory.getProvinces($scope.customer.country, function(data, error){
            $scope.provinces = data;
            $("#provinces").select2({
                theme: "bootstrap"
            });
        });
    }

    countryFactory.getActive(function(data){
        $scope.countries = data;
        $("#country").select2({
            theme: "bootstrap"
        });
    });

    $scope.sendForm = function(e){
        e.preventDefault();

        customerAdminFactory.create($scope.customer, function(data, error){
            window.scrollTo(0, 0);
            if(error){
                $scope.customer.errors = ["Sucedió un error al guardar desde el servidor, por favor contacte con el administrador del sistema"]
                return;
            }

            console.log(data);
            if(!data.success){
                $scope.customer.errors = [];

                Object.keys(data.errors).forEach(function(e){
                    data.errors[e].forEach(function(err){
                        $scope.customer.errors.push(`${e} ${err}`);
                    });
                });

                return;
            }

            window.location.href = "/admin/customers";
        });

        enableButtonCommit();
    }
}]);