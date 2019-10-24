// ********** use get method
// var express =require('express')
// var app = express()

// app.get('/',function(req,res){
//     res.sendFile(__dirname+'/'+'showForm.html')
// })

// app.get('/showData', function(req,res){
//     var data = {
//         firstname: req.query.fname,
//         lastname: req.query.lname
//     }
//     console.log(data)
//     res.end(JSON.stringify(data))
// })

// app.listen(8081)


// ********** use post method
var express =require('express')
var app = express()
var body = require('body-parser')

app.use(body())
app.get('/',function(req,res){
    res.sendFile(__dirname+'/'+'showForm.html')
})

app.post('/showData', function(req,res){
    var data = {
        firstname: req.body.fname,
        lastname: req.body.lname
    }
    console.log(data)
    res.end(JSON.stringify(data))
})

app.listen(8081)