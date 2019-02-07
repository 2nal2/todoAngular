hisab.controller('customerAdminController', ['$scope', 'customerAdminFactory', "countryFactory", function ($scope, customerAdminFactory, countryFactory) {
    $scope.customer = {
        status: true,
        type_customer: "n",
        interest_rate: 0,
        credit_limit: 0,
        credit_time_limit: 0,
        preferential_price: "p",
        discount: 0
    };

    $scope.loadCustomer = function (id) {
        if (!id) {
            loadCountries();
            return;
        }

        loadCountries(function () {
            customerAdminFactory.get(id, function (data, error) {
                if (error) {
                    $scope.errors_messages = ["No se puede cargar el cliente"];
                    setTimeout(function () {
                        window.location.href = "/admin/customers";
                    }, 2000);
                    return;
                }

                $scope.customer = data;
                $scope.loadProvinces();
            });
        });
    }

    function enableButtonCommit() {
        setTimeout(function () {
            document.getElementsByName("commit").forEach(function (e) {
                e.disabled = false;
            });
        }, 100);
    }

    $scope.loadProvinces = function () {
        countryFactory.getProvinces($scope.customer.country, function (data, error) {
            $scope.provinces = data;
            $("#provinces").select2({
                theme: "bootstrap"
            });
        });
    }

    function loadCountries(callback) {
        countryFactory.getActive(function (data) {
            $scope.countries = data;
            $("#country").select2({
                theme: "bootstrap"
            });
            if (callback)
                callback();
        });
    }

    $scope.sendForm = function (e) {
        e.preventDefault();

        let customer = Object.assign({}, $scope.customer);

        if (customer.type_customer == 'n')
            customer.person_attributes = customer.person;
        else
            customer.organization_attributes = customer.organization;

        customer.organization = null;
        customer.person = null;


        if (customer.id)
            update(customer);
        else
            create(customer);

    };

    function create(customer) {
        customerAdminFactory.create(customer, function (data, error) {
            window.scrollTo(0, 0);
            if (error) {
                $scope.customer.errors = ["Sucedió un error al guardar desde el servidor, por favor contacte con el administrador del sistema"];
                enableButtonCommit();
                return;
            }

            if (!data.success) {
                $scope.errors = [];
                $scope.errors_messages = data.full_message;

                Object.keys(data.errors).forEach(function (e) {
                    data.errors[e].forEach(function (err) {
                        $scope.errors.push(`${e} ${err}`);
                    });
                });

                enableButtonCommit();
                return;
            }

            window.location.href = "/admin/customers";
        });
    }

    function update(customer) {
        customerAdminFactory.update(customer, function (data, error) {
            window.scrollTo(0, 0);
            if (error) {
                $scope.customer.errors = ["Sucedió un error al guardar desde el servidor, por favor contacte con el administrador del sistema"];
                enableButtonCommit();
                return;
            }

            if (!data.success) {
                $scope.errors = [];
                $scope.errors_messages = data.full_message;

                Object.keys(data.errors).forEach(function (e) {
                    data.errors[e].forEach(function (err) {
                        $scope.errors.push(`${e} ${err}`);
                    });
                });

                enableButtonCommit();
                return;
            }

            window.location.href = "/admin/customers";
        });
    }
}]);