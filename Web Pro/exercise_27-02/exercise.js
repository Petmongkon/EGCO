var express = require('express')
var app = express()
var body = require('body-parser')
var mongoClient = require('mongodb').MongoClient
var url = "mongodb://localhost:27017"


app.use(body())
app.set('view engine','ejs')
app.get('/',function(req,res){
    mongoClient.connect(url,function(err,db){
        if(err)throw err
        var dbo = db.db("Company")
        dbo.collection("students").find({}).toArray(function(err,data){
            if(err)throw err
            res.render('showData',{data:data})
            db.close()
        })
        

    })
})

app.get('/addStudent',function(req,res){
    res.sendFile(__dirname+'/addStudent.html')
    
})

app.post('/insert',function(req,res){
    res.sendFile(__dirname+'/addStudent.html')
    mongoClient.connect(url,function(err,db){
        if(err) throw err
        var dbo = db.db("Company")
        var id_db = req.body.id
        var name_db = req.body.firstname
        var sur_db = req.body.lastname
        var age_db = req.body.age
        var obj = {id : id_db,
        firstname : name_db,
        lastname : sur_db,
        age : age_db}
        dbo.collection("students").insertOne(obj,function(err,res){
            console.log("insert",res)
            db.close()
            
        })
        
        
    })
    res.redirect('/')
})


app.listen(8081)