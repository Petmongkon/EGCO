'use strict'
var mongoose = require('mongoose')
var Schema = mongoose.Schema

var UserSchema = new Schema({
    Username: {
        type: String,
        Required: 'Please enter'
    },
    Password: {
        type: String,
        Required: 'Please enter'
    }
})

module.exports = mongoose.model('Auth', UserSchema)