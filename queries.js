const Pool = require('pg').Pool

//const bodyParser = require('body-parser')
var fs = require('fs')
var publicDir = require('path').join(__dirname,'/stronka');

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
    //response.status(200).json(results.rows)
    var wp = JSON.stringify(results.rows);
    fs.writeFile("stronka/rezerwacje.json", wp, function(err) {
    if (err) {
      //  console.log(err);
    }
    });
    fs.readFile('stronka/rezerwacje.html', function(err, data) {
      response.writeHead(200, {'Content-Type': 'text/html'});
      //response.send(wp)
      response.write(data);
      response.end();

    })
  })
}

const getPokoje = (request, response) => {

  pool.query('SELECT * FROM pokoje', (error, results) => {
    if (error) {
      throw error
    }
    //response.status(200).json(results.rows)
    var wp = JSON.stringify(results.rows);
    fs.writeFile("stronka/pokoje.json", wp, function(err) {
    if (err) {
      //  console.log(err);
    }
    });
    fs.readFile('stronka/index5.html', function(err, data) {
      response.writeHead(200, {'Content-Type': 'text/html'});
      //response.send(wp)
      response.write(data);
      response.end();

    })
  })
}

const getWolnepokoje = (request, response) => {
  pool.query('SELECT * FROM pokoje where dostepnosc=true', (error, results) => {
    if (error) {
      throw error
    }
    var wp = JSON.stringify(results.rows);
    //choose_free_rooms(wp)
    //console.log(wp);
    fs.writeFile("stronka/wolnepokoje.json", wp, function(err) {
    if (err) {
      //  console.log(err);
    }
    });

    fs.readFile('stronka/index3.html', function(err, data) {
      response.writeHead(200, {'Content-Type': 'text/html'});
      //response.send(wp)
      response.write(data);
      response.end();

    })

    //response.status(200).json(results.rows)
      //getPokoje_site(wp);


  })

}

const getStandardy = (request, response) => {

  pool.query('SELECT * FROM standardy', (error, results) => {
    if (error) {
      throw error
    }
    //response.status(200).json(results.rows)
    var wp = JSON.stringify(results.rows);
    //choose_free_rooms(wp)
    //console.log(wp);
    fs.writeFile("stronka/standardy.json", wp, function(err) {
    if (err) {
      //  console.log(err);
    }
    });

    fs.readFile('stronka/standardy.html', function(err, data) {
      response.writeHead(200, {'Content-Type': 'text/html'});
      //response.send(wp)
      response.write(data);
      response.end();

    })
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

  pool.query('UPDATE pokoje SET dostepnosc = false WHERE p = $1', [p], (error, results) => {
    if (error) {
      throw error
      console.log('aaaaaaaaaaa')
    } else {
      console.log('bbbbbbbb')
      console.log(results)
    }
    //response.status(200).send('Zmieniono status pokoju nr $1', [p])
  })
}

const deleteRezerwacja = (request, response) => {
  //console.log(request.param("r"));
  var numer_pokoju;
  var p;
  const r = request.param("r");
  pool.query('SELECT p FROM rezerwacje WHERE r = $1', [r], (error, results) => {
    if (error) {
      throw error
    } else {
      //console.log('pokoj numer: ')
      //console.log(results)
      console.log('pokoj:')
      numer_pokoju = parseInt(results.rows[0].p)
      p = results.rows[0].p
      console.log(numer_pokoju)
      console.log(p)
      pool.query('DELETE FROM rezerwacje WHERE r = $1', [r], (error, results) => {
        if (error) {
          throw error;
        }
        response.status(200).send(`Usunięto rezerwację: ${r}`)

        pool.query('UPDATE pokoje SET dostepnosc = true WHERE p = $1 ', [p] , (error, results) => {
          if (error) {
            throw error
            console.log('cccc')
          } else {
            console.log(results)
            console.log('zmieniono pokoj nr ' + numer_pokoju +' na wolny')
          }
        })
      })
    }

  })





}
/*
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
*/
/*
function getPokoje_site(){
  console.log('haha');
}*/
/*
  var table = document.getElementById("pokoje");
  var row = table.insertRow(0);

// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
var cell1 = row.insertCell(0);
var cell2 = row.insertCell(1);

// Add some text to the new cells:
cell1.innerHTML = "NEW CELL1";
cell2.innerHTML = "NEW CELL2";
*/


/*
  const getPokoje_site = (request, response) => {
    pool.query('SELECT * FROM pokoje', (error, results) => {
      if (error) {
        throw error
      }
      var wp = JSON.stringify(results.rows);
      //choose_free_rooms(wp)
      console.log(wp);
      //response.status(200).json(results.rows)
    })
  }


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
  //getPokoje_site,
  /*
  createUser,
  updateUser,
  deleteUser,*/
}
