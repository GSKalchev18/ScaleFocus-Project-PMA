const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
const crypto = require('crypto');
let bodyParser = require('body-parser');

let router = express.Router();

// Parse application/json
router.use(bodyParser.json());

// Parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

(async () => {
    try{
        let connection = await sql.connect(config);
        const users_result = await connection.request().query(`SELECT * FROM Users`);

        router.get('/edit', function(req, res) {
            res.render('edit_page', 
            {userList: users_result.recordset});
        });
    }
    catch(err)
    {
        console.log(err);
    }
})()

const sha256 = crypto.createHash('sha256');

router.post('/edit', async function(req, res, next) {
    try {
        // Put data into the Sql server
        const pool = await sql.connect(config);
        const passHash = sha256.update(req.body.Password).digest('hex');
        
        const result = await pool.request()
        .input("Username", sql.VarChar, req.body.Username)
        .input("First_Name", sql.NVarChar, req.body.First_Name)
        .input("Last_Name", sql.NVarChar, req.body.Last_Name)
        .input("Password", sql.VarChar, passHash)
        .query(`UPDATE Users 
                SET Username = @Username, First_Name = @First_Name, Last_Name = @Last_Name, Password = @Password
                WHERE Id = 1`);
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/users");
});

module.exports = router;