const Pool = require('pg').Pool

//database user but how to share a database XD?
const pool = new Pool({
  user: 'me',
  host: 'localhost',
  database: 'api',
  password: 'anka',
  port: 5432,
})

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

const getWolnepokoje = (request, response) => {

  pool.query('SELECT * FROM pokoje where dostepnosc=true', (error, results) => {
    if (error) {
      throw error
    }
    var wp = JSON.stringify(results.rows);
    choose_free_rooms(wp)
    //console.log(wp);
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
  const { imie, nazwisko, p } = request.body

  pool.query('INSERT INTO rezerwacje (imie, nazwisko, p) VALUES ($1, $2,$3)', [imie, nazwisko, p], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`<h4>Dodano rezerwację</h4>`)
  })
}

const deleteRezerwacja = (request, response) => {
  //console.log(request.param("r"));
  const r = request.param("r");

  pool.query('DELETE FROM rezerwacje WHERE r = $1', [r], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).send(`Usunięto rezerwację: ${r}`)
  })
}

function choose_free_rooms(free_rooms){
  console.log(free_rooms);
  var list = free_rooms;
  var selector = '#table';
  var cols = Headers(list, selector);
  for (var i = 0; i < list.length; i++) {
                var row = ('<tr/>');
                for (var colIndex = 0; colIndex < cols.length; colIndex++)
                {
                    var val = list[i][cols[colIndex]];

                    // If there is any key, which is matching
                    // with the column name
                    if (val == null) val = "";
                        row.append(('<td/>').html(val));
                }

                // Adding each row to the table
                $(selector).append(row);
            }
}

function Headers(list, selector) {
            var columns = [];
            var header = ('<tr/>');

            for (var i = 0; i < list.length; i++) {
                var row = list[i];

                for (var k in row) {
                    if ($.inArray(k, columns) == -1) {
                        columns.push(k);

                        // Creating the header
                        header.append(('<th/>').html(k));
                    }
                }
            }
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
  getWolnepokoje,
  getStandardy,
  createRezerwacja,
  deleteRezerwacja,
  /*
  createUser,
  updateUser,
  deleteUser,*/
}
