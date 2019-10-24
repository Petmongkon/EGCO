'use strict'
const mongoose      = require('mongoose')
const bcrypt        = require('bcrypt')
const saltRounds    = 10
const jwt           = require('jsonwebtoken')
const Auth          = mongoose.model('Auth')

exports.authenticateUser = (req, res) => {
    var newAuth = req.body
    let query = { Username: newAuth.Username }
    // console.log(newAuth.Username)
    // console.log(newAuth.Password)
    Auth.findOne(query, (err ,user) => {
        if (err) throw err
        if (!user) {
            res.status(403).send({
                success: false,
                message: 'unauthorized'
            })
            return
        }
        bcrypt.compare(newAuth.Password, user.Password, (err, status) => {
            if (err) throw err
            // console.log(status)
            if (status == false) {
                res.status(403).send({
                    success: false,
                    message: 'unauthorized'
                })
            } else {
                const payload = {
                    user: newAuth.Username
                }
                let token = jwt.sign(payload, 'secret', {
                    expiresIn: 60 * 60 * 24
                })
                res.json({
                    success: true,
                    token: token
                })
                res.success = true
                // console.log(res.success)
            }
        })
    })
}

exports.registerUser = function(req, res){
    var newAuth = req.body
    let query = { Username: newAuth.Username }
    Auth.findOne(query, (err ,user) => {
        if (user) {
            res.status(409).send({
                success: false,
                message: 'username conflict'
            })
            return
        }
        bcrypt.hash(newAuth.Password, saltRounds, (err, hash) => {
            if(err) throw err
            let newUser = new Auth({
                Username: newAuth.Username,
                Password: hash
            })
            newUser.save(function(err, user){
                if(err) throw err
                res.json(user)
            })
        })
    })
}

exports.verifyAccessTokenMiddleware = function(req, res, next) {
    let token = null
    if (req.headers.authorization != null) {
        let parts = req.headers.authorization.split(' ')
        if (parts.length === 2) {
            let scheme = parts[0]
            let credentials = parts[1]
            if (/^Bearer$/i.test(scheme)) {
                token = credentials
            }
        }
    }
    if (token) {
        jwt.verify(token, 'secret', (err, decoded) => {
            if (err) {
                return res.status(403).send({
                    success: false,
                    message: 'unauthorized'
                })
            } else {
                req.decoded = decoded
                next()
            }
        })
    } else {
        return res.status(403).send({
            success: false, 
            message: 'No token provided.' 
        })
    }
}