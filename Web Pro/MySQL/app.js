var mysql = require('mysql')

var con = mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "egco427",
    password: "egco427",
    database: "egco427db"
})

con.connect(function(err){
    if(err) throw err
    console.log("Database connected ")
    
    var firstname = 'Bob'
    var values = [
        ['2', 'Tom', 'Cat', 19],
        ['3', 'Amy', 'Apple', 52],
        ['4', 'Hannah', 'Lamb', 21],
        ['5', 'Michael', 'Valley', 34],
        ['6', 'Sandy', 'Ocean', 28],
        ['7', 'Betty', 'Green', 15],
        ['8', 'Richard', 'Sky', 33],
        ['9', 'Susan', 'Bay', 48],
        ['10', 'Vicky', 'Yellow', 29],
        ['11', 'Ben', 'Park', 38],
        ['12', 'William', 'Central', 54],
        ['13', 'Chuck', 'May', 39],
        ['14', 'Viola', 'Sideway', 33]
      ]

    var sql = "UPDATE students SET age = 25 WHERE firstname = ? "

    

    con.query(sql,[firstname],function(err,result,fields){
        if(err) throw err
        console.log("Number of updated records : "+result.affectedRows)
    })

})