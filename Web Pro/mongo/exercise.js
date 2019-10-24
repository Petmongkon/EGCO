var mongoClient = require('mongodb').MongoClient
var url = "mongodb://localhost:27017"
var express = require('express')
var app = express()

app.get('/products', function (req, res) {
    mongoClient.connect(url, function (err, db) {
        if (err) throw err
        var dbo = db.db("Company")
        var obj
        dbo.collection("product").find({}).toArray(function (err, resp) {
            if (err) throw err
            //console.log(res)
            db.close()
            var result = '<table><tr><th>Name</th><th>Price</th>';
            for  (var i=0; i<resp.length;i++) {
                result += "<tr><td>" + resp[i].name + "</td><td>" + resp[i].price + "</td></tr>";
                
            }
            result += '</table>';

            res.send(result);
        })


    })

})
app.get('/product/:search', function (req, res) {
    mongoClient.connect(url, function (err, db) {
        if (err) throw err
        var dbo = db.db("Company")
        var query = {
            name: req.params.search
        }
        dbo.collection("product").find(query).toArray(function (err, resp) {
            if (err) throw err
            console.log(resp)
            db.close()
            var result = '<table><tr><th>Name</th><th>Price</th>';
            for  (var i=0; i<resp.length;i++) {
                result += "<tr><td>" + resp[i].name + "</td><td>" + resp[i].price + "</td></tr>";
                
            }
            result += '</table>';

            res.send(result);

        })
    })

})

app.listen(8081)