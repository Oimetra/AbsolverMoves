var express = require('express');
var mysql = require('mysql');
var fs = require('fs');
var app = express();
var con = mysql.createConnection({
  host: 'localhost',
  user: 'AbsolverReader',
  password: '',
  database: 'absolver'
});

con.connect(function(err) {
  if (err) throw err;
  console.log('Connected to database as user AbsolverReader');
});

app.get('/test', function (req, res) {
  con.query('SELECT * FROM style', function (err, result, fields) {
  res.end(JSON.stringify(result));
  });
});

app.get('/index', function (req, res) {
  fs.readFile('index.html', function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    res.end();
  });
});

var server = app.listen(8080, function () {
  console.log('listening at localhost 8080');
});
