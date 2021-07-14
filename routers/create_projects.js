const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
let bodyParser = require('body-parser');

let router = express.Router();

// Parse application/json
router.use(bodyParser.json());

// Parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/create_project', function (req, res)
{
    res.render('create_project');
});

router.post('/create_project', async function(req, res, next) {
    try {
        // Put team into the Sql server
        const pool = await sql.connect   (config);

        const result = await pool.request()
        .input("Title", sql.NVarChar, req.body.Title)
        .input("Description", sql.NVarChar, req.body.Description)
        .query(`INSERT INTO Projects (Title, Description) VALUES (@Title, @Description)`);
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/create_project");
});

module.exports = router;