var mongoClient = require('mongodb').MongoClient
var url = "mongodb://localhost:27017"


// insert
// mongoClient.connect(url,function(err,db){
//     if(err) throw err
//     var dbo = db.db("Company")
//     dbo.createCollection("product",function(err,res){
//         if(err)throw err
//         console.log("Collection create!")
//         db.close()
//     })
// })

// var obj = [ 
//     { name: "Book", price: "10" },
//     { name: "Pencil", price: "5" },
//     { name: "Calculator", price: "40" },
//     { name: "Notebook", price: "15" },
//     { name: "T-Shirt", price: "20" },
//     { name: "Jacket", price: "20" }
//   ]

// mongoClient.connect(url,function(err,db){
//     if(err) throw err
//     var dbo = db.db("Company")
//     // var obj = {name: "Coffee Mug",price: "10"}
//     dbo.collection("product").insertMany(obj,function(err,res){
//         if(err)throw err
//         console.log("Inserted "+res.insertedCount+" item")
//         db.close()
//     })
// })

mongoClient.connect(url,function(err,db){
    if(err) throw err
    var dbo = db.db("Company")
    var query = {name: /^C/}
    dbo.collection("product").find(query).toArray(function(err,res){
        if(err)throw err
        console.log(res)
        db.close()
    })
})