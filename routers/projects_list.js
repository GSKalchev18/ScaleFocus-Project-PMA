const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

router.get('/projects', async (req,res) => {
    try{
        let connection = await sql.connect(config);
        const projectsteams_result = await connection.request()
        .query(`SELECT * FROM vProjectsTeams`);

            if (req.session.isAdmin == true) {
                res.render('projects_list', 
                {ProjectsTeams: projectsteams_result.recordset});
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