const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

(async () => {
    try{
        let connection = await sql.connect(config);
        const projectstasksusers_result = await connection.request()
        .query(`SELECT * FROM vProjectsTasksUsers`);

        router.get('/tasksL', function(req, res) {
            if (req.session.isAdmin == true) {
                res.render('tasks_list', 
                {ProjectsTasksUsers: projectstasksusers_result.recordset});
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