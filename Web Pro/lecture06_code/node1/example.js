//---------ex1
// var http=require('http');
// http.createServer(function(request,response)
// {
//     response.writeHead(200,{'Content-Type':'text/plain'});
//     response.end('Hello World\n');

// }).listen(8081);
// console.log('Server running at http://127.0.0.1:8124/');

//----------ex2
// console.log(__dirname);

//----------ex3
// HelloWorld=()=>console.log("Hello World");

// var t = setTimeout(HelloWorld,5000)

//----------ex4 circle.js
// var circle = require('./circle.js')
// console.log(circle.area(50))
// console.log(circle.add(1,2))
// console.log(circle.greeting())
// circle.data.readData()
// circle.data.writeData()

//-----------ex5 
// var util = require('util');
// var fs = require('fs');

// function readFile(str, callback){
//     var lines =[];
//     fs.readFile(str, function (err, data) {
//         if (err) throw err; 
//         lines.push(data); 
//         console.log(data.toString());
//     });
//    callback(lines);
// }

// var a, b;
// readFile('./20.txt', function(data){
//     a= data;
// }); 

// readFile('./10.txt',function(data){
//     b= data;
// }); 
// util.log("a -- "+a);
// util.log("b -- " +b);

//-------------ex6
// var assert = require('assert');
// add=(a,b)=>a+b
// var expected = add(1,2);
// assert(expected==3,'one plus two is three')

// var buf = new Buffer ('Hello World')
// var json = buf.toJSON(buf)
// console.log(json)

//ex-----------18
var http = require('http')
var fs = require('fs')
http.createServer(function (req, res) {
    if (req.url === '/home' || req.url === '/') {
        res.writeHead(200, {
            'Content-Type': 'text/html'
        })
        var myStream = fs.createReadStream(__dirname + '/' + 'index.html', 'utf8')
        myStream.pipe(res)
    } 
    else if (req.url==='/facebook'||req.url==='/'){
        res.writeHead(200,{'Content':'text/html'})
        var myStream = fs.createReadStream(__dirname+'/'+'/facebook.html','utf8')
        myStream.pipe(res)
    }
    else if (req.url==='/youtube'||req.url==='/'){
        res.writeHead(200,{'Content':'text/html'})
        var myStream = fs.createReadStream(__dirname+'/'+'/youtube.html','utf8')
        myStream.pipe(res)
    }
    else {
        res.writeHead(200,{'Content':'text/html'})
        var myStream = fs.createReadStream(__dirname+'/'+'/notfound.html','utf8')
        myStream.pipe(res)
    }


}).listen(8081, '127.0.0.1')