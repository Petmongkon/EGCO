const express       = require('express')
const mongoose      = require('mongoose')
const bodyParser    = require('body-parser')
const cors          = require('cors')

const port = process.env.PORT || 3000
const app = express()
app.use(cors())
app.use(bodyParser.urlencoded({
    extended: true
}))

app.use(bodyParser.json())

const User = require('./api/models/userListModel')
const Auth = require('./api/models/authModel')

// connect to database
mongoose.Promise = global.Promise
mongoose.connect('mongodb://localhost/Assignment_1', (err) => {
    if (err) throw err
    console.log('Successfully connected.')
})

const routes = require('./api/routes/userListRoutes')
routes(app)

const authRoutes = require('./api/routes/authRoutes')
authRoutes(app)

app.listen(port)
console.log('Server started on: ' + port)