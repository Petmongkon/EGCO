'use strict'
module.exports = function(app){
    var userList = require('../controllers/authController')

    app.route('/register')
                .post(userList.registerUser)

    app.route('/authenticate')
                .post(userList.authenticateUser)
}
