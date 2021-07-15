const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
let bodyParser = require('body-parser');

let router = express.Router();

// Parse application/json
router.use(bodyParser.json());

// Parse application/x-www-form-urlencoded
router.use(bodyParser.urlencoded({ extended: true }));

router.get('/tasks', async (req,res) => {
    try{
        let connection = await sql.connect(config);
        const projects_result = await connection.request().query(`SELECT * FROM Projects`);
        const users_result = await connection.request().query(`SELECT * FROM Users WHERE Id != 1008`);

        if (req.session.isAdmin == true) {
            res.render('create_and_assign_task', 
            {ProjectsList: projects_result.recordset, UsersList:users_result.recordset});
        } else {
            res.render('error_page');
        }
    }
    catch(err)
    {
        console.log(err);
    }
});


router.post('/tasks', async function(req, res, next) {
    try {
        // Put team into the Sql server
        const pool = await sql.connect   (config);

        const result = await pool.request()
        .input("Title", sql.NVarChar, req.body.Title)
        .input("Description", sql.NVarChar, req.body.Description)
        .input("ProjectsId", sql.Int, req.body.ProjectsId)
        .input("AssigneeId", sql.Int, req.body.AssigneeId)
        .query(`INSERT INTO Tasks 
                (ProjectsId, AssigneeId, Title, Description) 
                VALUES (@ProjectsId, @AssigneeId, @Title, @Description)`);
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/tasks");
});

module.exports = router;