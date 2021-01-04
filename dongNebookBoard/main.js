const express = require('express');
const app = express();
const port = 81; 
app.get('/', function (req, res) {
  res.send('Hello Wold!');
});
  
var server = app.listen(port, function () {
  var host = server.address().address;
  var port = server.address().port;
  
  console.log('Server is working : PORT - ',port);
});