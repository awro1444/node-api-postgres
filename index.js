//test
const express = require('express') //
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3000 //go to localhost:3000
var fs = require('fs')
var publicDir = require('path').join(__dirname,'/stronka');
app.use(express.static(publicDir));


app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
  fs.readFile('stronka/index.html', function(err, data) {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.write(data);
    response.end();
  })
  //response.json({ info: 'Node.js, Express, and Postgres API' })
})

//calling methods from queries.js
app.get('/users', db.getUsers)
app.get('/users/:id', db.getUserById)
app.post('/users', db.createUser)
app.put('/users/:id', db.updateUser)
app.delete('/users/:id', db.deleteUser)

app.get('/index4.html', (request, response) => {
  fs.readFile('stronka/index4.html', function(err, data) {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.write(data);
    response.end();
  })
  //response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.get('/index3.html', (request, response) => {
  fs.readFile('stronka/index3.html', function(err, data) {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.write(data);
    response.end();
  })
  ///response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.post('/index2.html', (request, response) => {
  fs.readFile('stronka/index2.html', function(err, data) {
    response.writeHead(200, {'Content-Type': 'text/html'});
    response.write(data);
    response.end();
  })
  //response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})
