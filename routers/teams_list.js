const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

(async () => {
    try{
        let connection = await sql.connect(config);
        const teams_result = await connection.request()
        .query(`SELECT * FROM vUsersTeams`);

        router.get('/teams', function(req, res) {
            if (req.session.isAdmin == true) {
                res.render('teams_list', 
                {TeamsList: teams_result.recordset});
            } else {
                res.render('error_page');
            }
        });
    }
    catch(err)
    {
        console.log(err);
    }
})()

module.exports = router;