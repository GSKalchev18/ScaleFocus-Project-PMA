const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

(async () => {
    try{
        let connection = await sql.connect(config);
        const projects_result = await connection.request().query(`SELECT * FROM Projects`);
        const teams_result = await connection.request().query(`SELECT * FROM Teams`);

        router.get('/teamsprojects', function(req, res) {
            if (req.session.isAdmin == true) {
                res.render('assigneTeamsToProjects', 
                {ProjectsList: projects_result.recordset, TeamsList:teams_result.recordset});
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

router.post('/teamsprojects', async function(req, res, next) {
    try {
        // Put team into the Sql server
        const pool = await sql.connect   (config);

        const result = await pool.request()
        .input("ProjectId", sql.Int, req.body.ProjectId)
        .input("TeamId", sql.Int, req.body.TeamId)
        .query("INSERT INTO ProjectsTeams (ProjectsId, TeamsId) VALUES (@ProjectId, @TeamId)");
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/teamsprojects");
});

module.exports = router;