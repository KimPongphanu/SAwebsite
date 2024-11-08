/////////////////////////////////////////
///////////Command :: node setupTestUser.js
////////////////////////////////////////

const bcrypt = require('bcrypt');
const mysql = require('mysql');
const saltRounds = 10;

//Enter CreateDetail
const testUser = {
  phone: '00000',
  password: '12345',
  rank: 1
};

const connectionConfig = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'saproject'
};

async function setupTestUser() {
  const connection = mysql.createConnection(connectionConfig);

  connection.connect((err) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      return;
    }
    console.log('Connected to the database.');

    bcrypt.hash(testUser.password, saltRounds, (err, hashedPassword) => {
      if (err) {
        console.error('Error hashing password:', err);
        connection.end();
        return;
      }

      const query = 'INSERT INTO users (phone, password, rank) VALUES (?, ?,?)';
      const values = [testUser.phone, hashedPassword,testUser.rank];
    
      connection.query(query, values, (error, results) => {
        if (error) {
          console.error('Error executing query:', error);
        } else {
          console.log('Test user added:', results);
        }

        connection.end();
      });
    });
  });
}

setupTestUser();
