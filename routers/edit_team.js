const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
let bodyParser = require('body-parser');

let router = express.Router();

// Parse application/json
router.use(bodyParser.json());

// Parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/edit_teams', async (req,res) => {
    try{
        let connection = await sql.connect(config);
        const teams_result = await connection.request().query(`SELECT * FROM Teams`);
            res.render('teams_list', 
            {TeamsList: teams_result.recordset});
    }
    catch(err)
    {
        console.log(err);
    }
});

router.post('/edit_teams', async function(req, res, next) {
    try {
        const pool = await sql.connect(config);
        
        const result = await pool.request()
        .input("Title", sql.NVarChar, req.body.Title)
        .input("Description", sql.NVarChar, req.body.Description)
        .input("Id", sql.Int, req.body.Id)
        .query(`UPDATE Teams 
                SET Title = @Title, Description = @Description 
                WHERE Id = @Id`);
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/teams");
});

module.exports = router;