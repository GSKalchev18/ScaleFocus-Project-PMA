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

router.get('/register', function (req, res)
{
    res.render('Register_User');
});

const sha256 = crypto.createHash('sha256');

router.post('/register', async function(req, res, next) {
    try {
        // Put data into the Sql server
        const pool = await sql.connect   (config);
        const passHash = sha256.update(req.body.Password).digest('hex');
        
        const result = await pool.request()
        .input("Username", sql.VarChar, req.body.Username)
        .input("First_Name", sql.NVarChar, req.body.First_Name)
        .input("Last_Name", sql.NVarChar, req.body.Last_Name)
        .input("Password", sql.VarChar, passHash)
        .execute("RegisterUser");
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/register");
});

module.exports = router;