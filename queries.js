const Pool = require('pg').Pool

//database user but how to share a database XD?
const pool = new Pool({
  user: 'me',
  host: 'localhost',
  database: 'api',
  password: 'anka',
  port: 5432,
})
var alert

const getRezerwacje = (request, response) => {
  //showing everything from table users after going to localhost:3000/users
  pool.query('SELECT * FROM rezerwacje', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getPokoje = (request, response) => {

  pool.query('SELECT * FROM pokoje', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getStandardy = (request, response) => {

  pool.query('SELECT * FROM standardy', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}
/*
const getStandardy = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM standardy', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}
*/
const createRezerwacja = (request, response) => {
  const { r, imie, nazwisko, p } = request.body

  pool.query('INSERT INTO rezerwacje (r, imie, nazwisko, p) VALUES ($1, $2,$3,$4)', [r, imie, nazwisko, p], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`Dodano rezerwację`)
  })
}

const deleteRezerwacja = (request, response) => {
  //console.log(request.param("r"));
  const r = request.param("r");

  pool.query('DELETE FROM rezerwacje WHERE r = $1', [r], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).send(`User modified with ID: ${r}`)
  })
}

/*
const updateUser = (request, response) => {
  const id = parseInt(request.params.id)
  const { name, email } = request.body

  pool.query(
    'UPDATE users SET name = $1, email = $2 WHERE id = $3',
    [name, email, id],
    (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`User modified with ID: ${id}`)
    }
  )
}

const deleteUser = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`User deleted with ID: ${id}`)
  })
}*/

module.exports = {
  getRezerwacje,
  getPokoje,
  getStandardy,
  createRezerwacja,
  deleteRezerwacja,
  /*
  createUser,
  updateUser,
  deleteUser,*/
}
