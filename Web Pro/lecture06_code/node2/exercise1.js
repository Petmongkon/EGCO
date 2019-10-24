var fs = require('fs')
var content = fs.readFileSync('users.json')
var jsonContent = JSON.parse(content)

var crypto = require('crypto')


endcry=(pass)=>{var shasum = crypto.createHash('sha1');shasum.update(pass);return shasum.digest('hex')}

var express = require('express')
var routing=express()
routing.get('/profile/:id',function(req,res){
    res.send("<p1> id : "+jsonContent.users[req.params.id].id+"</br> username : "+jsonContent.users[req.params.id].username+"</br> password : "+endcry(jsonContent.users[req.params.id].password)+"</br> fullname : "+jsonContent.users[req.params.id].fullname+"</p>")
})
routing.listen(8081)