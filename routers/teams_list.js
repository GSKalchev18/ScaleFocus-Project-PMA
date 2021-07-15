const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

router.get('/teams', async (req,res) => {
    try{
        let connection = await sql.connect(config);
        const teams_result = await connection.request()
        .query(`SELECT * FROM Teams`);
        const usersteams_result = await connection.request()
        .query(`SELECT * FROM vUsersTeams`);

            if (req.session.isAdmin == true) {
                res.render('teams_list', 
                {TeamsList: teams_result.recordset, UsersTeams: usersteams_result.recordset});
            } else {
                res.render('error_page');
            }
    }
    catch(err)
    {
        console.log(err);
    }
});

module.exports = router;