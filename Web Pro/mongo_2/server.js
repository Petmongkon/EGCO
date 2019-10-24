var mongoClient = require('mongodb').MongoClient
var url = "mongodb://localhost:27017"

mongoClient.connect(url,function(err,db){
    if (err) throw err
    var dbo = db.db("Company")
    var query = {name :/^C/}
    // var obj = {name:"Bag",price:"5"}
    var obj = [
        {name:"Wallet",price:"42"},
        {name:"Bottle",price:"51"},
        {name:"Paper Bag",price:"15"}
    ]
    var updateItems = {$set:{name:"Candy",price:"3"}}
    dbo.collection("product").insertMany(obj,function(err,res){
        if (err) throw err
        console.log(res.insertedCount+" item(s) is insert")
        db.close()
    })
})