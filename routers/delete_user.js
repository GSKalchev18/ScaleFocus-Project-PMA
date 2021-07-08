const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
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

        router.get('/delete', function(req, res) {
            res.render('users_list', 
            {userList: users_result.recordset});
        });
    }
    catch(err)
    {
        console.log(err);
    }
})()

router.post('/delete', async function(req, res, next) {
    try {
        const pool = await sql.connect(config);
        
        const result = await pool.request()
        .input("Id", sql.Int, req.body.Id)
        .query(`DELETE FROM Users WHERE Id = @Id`);
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/users");
});

module.exports = router;