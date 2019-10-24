var mysql = require('mysql')
var express = require('express')
var app = express()
var body = require('body-parser')

var con = mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "egco427",
    password: "egco427",
    database: "egco427db"
})

con.connect(function (err) {
    if (err) throw err
    console.log("Database connected ")

})

app.use(body())
app.set('view engine', 'ejs')
app.get('/', function (req, res) {


    var sql = "SELECT * FROM students"
    con.query(sql, function (err, result, fields) {
        res.render('showData', {
            data: result
        })
        console.log(result)
    })
})

app.get('/searchStudent', function (req, res) {
    var firstname = req.query.search + "%"
    console.log(firstname)
    var sql = "SELECT * FROM students WHERE firstname LIKE ? "

    con.query(sql, [firstname], function (err, result, fields) {
        if (err) throw err
        res.render('showData', {
            data: result
        })
    })

})

app.get('/deleteStudent/:name', function (req, res) {
    var firstname = req.params.name
    console.log(firstname)
    var sql = "DELETE FROM students WHERE firstname = ? "

    con.query(sql, [firstname], function (err, result, fields) {
        if (err) throw err
        console.log("Number of deteled records : " + result.affectedRows)
    })
    res.redirect('/')
})

app.get('/addStudent', function (req, res) {
    res.sendFile(__dirname + '/addStudent.html')

})
app.post('/insert', function (req, res) {
    res.sendFile(__dirname + '/addStudent.html')
    var id_db = req.body.id
    var name_db = req.body.firstname
    var sur_db = req.body.lastname
    var age_db = req.body.age
    var obj = {
        id: id_db,
        firstname: name_db,
        lastname: sur_db,
        age: age_db
    }
    console.log(obj)
    var sql = "INSERT INTO students SET ? "
    con.query(sql,obj,function(err,result){
        if(err) throw err
        console.log(result.affectedRows);
    })





res.redirect('/')
})

app.listen(8081)