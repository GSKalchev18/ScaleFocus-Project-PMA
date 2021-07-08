const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
let bodyParser = require('body-parser');

let router = express.Router();

// Parse application/json
router.use(bodyParser.json());

// Parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/register_team', function (req, res)
{
    res.render('register_team');
});

router.post('/register_team', async function(req, res, next) {
    try {
        // Put team into the Sql server
        const pool = await sql.connect   (config);

        const result = await pool.request()
        .input("Title", sql.NVarChar, req.body.Title)
        .input("Description", sql.NVarChar, req.body.Description)
        .execute("RegisterTeam");
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/register_team");
});

module.exports = router;