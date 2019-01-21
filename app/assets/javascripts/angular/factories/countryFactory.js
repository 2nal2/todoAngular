hisab.factory('countryFactory', ['$http', function ($http) {
    return {
        getActive: function (callback) {
            $http.get('/countries/active.json')
                .then(function (resp) {
                    callback(resp.data, null);
                }, function (error) {
                    callback(null, error);
                });
        },
        getProvinces: function(countryId, callback){
            $http.get(`/countries/${countryId}/provinces/active.json`)
                .then(function (resp) {
                    callback(resp.data, null);
                }, function (error) {
                    callback(null, error);
                });
        }
    };
}]);
