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
            $http.put(`/admin/customers/${customer.id}.json`, {customer})
                .then(function (resp) {
                    callback(resp.data, null);
                }, function (error) {
                    callback(null, error);
                });
        },
        get: function(customer_id, callback){
            $http.get(`/admin/customers/${customer_id}.json`)
                .then(function (resp) {
                    callback(resp.data, null);
                }, function (error) {
                    callback(null, error);
                });
        }
    };
}]);
