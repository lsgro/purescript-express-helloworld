exports.makeExpress = function() {
    var express = require('express');
    return express();
}

exports._get = function(app) {
    return function(route) {
        return function(handler) {
            return function() {
                app.get(route, function(req, res) {
                    var body = handler(req);
                    res.send(body);
                });
            }
        }
    }
}

exports._listen = function(app) {
    return function(port) {
        return function() {
            var server = app.listen(port, function () {
                var host = server.address().address;
                var port = server.address().port;

                console.log("Example app listening at http://%s:%s", host, port);
            });
        }
    }    
}

