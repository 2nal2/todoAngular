hisab.factory('customerAdminFactory', ['$http', function ($http) {
    return {
        create: function (customer, callback) {
            $http.post('/admin/customers.json', {customer})
                .then(function (resp) {
                    callback(resp.data, null);
                }, function (error) {
                    callback(null, error);
                });
        },
        update: function (customer, callback) {
            $http.post(`/admin/customers/${customer.id}.json`, {customer})
                .then(function (resp) {
                    callback(resp.data, null);
                }, function (error) {
                    callback(null, error);
                });
        }
    };
}]);
