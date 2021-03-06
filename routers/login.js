const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
let bodyParser = require('body-parser');

let router = express.Router();

// parse application/json
router.use(bodyParser.json());

// parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/login', function (req, res)
{
    res.render('login_page');
});

router.post('/login', async function(req, res, next) {
    try {
        const pool = await sql.connect   (config);
        const AdminUsername = req.body.Username;
        const AdminPass = req.body.Password
        
        const result = await pool.request()
        .input("Username", sql.NVarChar, AdminUsername)
        .query(`
            SELECT Password FROM Users WHERE Username = @Username AND IsAdmin = 1
        `)
        
        //Checks if the admin password matches the admin password in the database

        if(result.recordset[0].Password == AdminPass)
        {
            req.session.isAdmin = true;
        } else {

            req.session.isAdmin = false;
        }  
        
    } catch (err) {
        console.log(err);
    }

    res.redirect("/homepage");
});

module.exports = router;