const express = require('express') //
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3000 //go to localhost:3000
var fs = require('fs')

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
  fs.readFile('page1.html', function(err, data) {
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

app.listen(port, () => {
  console.log(`App running on port ${port}.`)
})
