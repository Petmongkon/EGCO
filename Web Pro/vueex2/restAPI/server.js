var express = require('express')
var mongoose = require('mongoose')
var boodyParser = require('body-parser')

app = express()
port = process.env.PORT || 8081
User = require('./api/models/userListModel')

mongoose.Promise = global.Promise
mongoose.connect('mongodb://localhost/Userdb',function(error){
    if(error) throw error
    console.log("Successfully connected")
})

app.use(boodyParser.urlencoded({
    extended: true
}))

app.use(boodyParser.json())

var routes = require('./api/routes/userListRoutes')
routes(app)

app.listen(port)
console.log('Server started on: '+ port)