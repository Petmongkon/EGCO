
var express = require('express')
var app = express()
var fs = require('fs')

app.get('/getusers',function(req,res){
    fs.readFile(__dirname+'/users.json','utf8',function(err,data){
        if (err) throw err
        console.log(data)
        res.end(data)
    })
})

app.get('/getusers/:id',function(req,res){
    fs.readFile(__dirname+'/users.json','utf8',function(err,data){
        if (err) throw err
        var users = JSON.parse(data)
        var user = users['user'+req.params.id]
        console.log(user)
        res.end(JSON.stringify(user))
    })
})

var server = app.listen(8081,function(){
    var host = server.address().address
    var port = server.address().port
    console.log("Application run at http://"+host+":"+port)
})

var user4 = {
    "user4":{
        "name":"betty",
        "password":"adfsd",
        "occupation":"enginerring",
        "id":4
    }
}

app.post('/adduser',function(req,res){
    fs.readFile(__dirname+'/users.json','utf8',function(err,data){
        if (err) throw err
        var users = JSON.parse(data)
        users["user4"] = user4["user4"]
        console.log(users)
        res.end(JSON.stringify(users))
    })
})

app.delete('/delusers/:index',function(req,res){
    fs.readFile(__dirname+'/users.json','utf8',function(err,data){
        if (err) throw err
        var users = JSON.parse(data)
        delete users['user'+req.params.index]
        console.log(users)
        res.end(JSON.stringify(users))
    })
})