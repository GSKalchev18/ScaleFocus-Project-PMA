const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

(async () => {
    try{
        let connection = await sql.connect(config);
        const teams_result = await connection.request()
        .query(`SELECT Teams.Id, Teams.Title, Teams.DateOfCreation FROM Teams`);

        const user_result = await connection.request()
        .query(`SELECT Users.First_Name, Users.Last_Name FROM Users`);

        router.get('/teams', function(req, res) {
            if (req.session.isAdmin == true) {
                res.render('teams_list', 
                {TeamsList: teams_result.recordset, UserList: user_result.recordset});
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