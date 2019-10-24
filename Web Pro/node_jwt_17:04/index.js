var express = require('express')
var bodyParser = require('body-parser')
var jwt = require('jsonwebtoken')

const app = express()
app.use(bodyParser.json())

app.get('/api',function api(req,res){
    res.json({
        description: 'JWT , Please Authenticate ! '
    })
})

app.post('/api/login',(req,res)=>{
    const user = { id : 3}

    const token = jwt.sign({ user : user.id }, 'secret_key')
    res.json({
        message: 'Authenticated! Use this token in the "Authiorization header"',
        token: token
    })
})

function ensureToken(req,res,next){
    const bearerHeader = req.headers["authorization"]
    if(typeof bearerHeader !== 'undefined'){
        const bearer = bearerHeader.split(" ")
        const bearerToken = bearer[1]
        req.token = bearerToken
        next()
    }
    else{
        res.sendStatus(403)
    }
}

app.get('/api/protected', ensureToken,(req,res)=>{
    jwt.verify(req.token,'secret_key',function(err,data){
        if(err) res.sendStatus(403)
        else{
            res.json({
                description : 'Protected Information',
                data : data
            })
        }
    })
})

app.listen(3000,function(){
    console.log('App listening on port 3000')
})