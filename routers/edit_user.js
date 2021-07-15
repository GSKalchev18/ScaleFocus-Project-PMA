const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
let bodyParser = require('body-parser');

let router = express.Router();

// Parse application/json
router.use(bodyParser.json());

// Parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/edit',  async (req,res) => {
    try{
        let connection = await sql.connect(config);
        const users_result = await connection.request().query(`SELECT * FROM Users`);
            res.render('edit_page', 
            {userList: users_result.recordset});
    }
    catch(err)
    {
        console.log(err);
    }
});

router.post('/edit', async function(req, res, next) {
    try {
        const pool = await sql.connect(config);
        
        const result = await pool.request()
        .input("Username", sql.VarChar, req.body.Username)
        .input("First_Name", sql.NVarChar, req.body.First_Name)
        .input("Last_Name", sql.NVarChar, req.body.Last_Name)
        .input("Id", sql.Int, req.body.Id)
        .execute("UpdateUsers");
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/users");
});

module.exports = router;