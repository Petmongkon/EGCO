'use strict'
var mongoose = require('mongoose')
var Schema = mongoose.Schema

var UserSchema = new Schema({
    ID: {
        type: String,
        Required: 'Please enter'
    },
    Firstname: {
        type: String,
        Required: 'Please enter'
    },
    Lastname:{
        type:String,
        required: 'Please enter'
    },
    Phone: {
        type: String,
        Required: 'Please enter'
    },
    Email: {
        type: String,
        Required: 'Please enter'
    },
    Facebook:{
        type: String,
        Required: 'Please enter'
    },
    Image:{
        type: String,
        Required: 'Please enter'
    }
})

module.exports = mongoose.model('Users', UserSchema)