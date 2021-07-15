const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
const {UserRepositories} = require('../repositories/users');

let router = express.Router();

let users = new UserRepositories();

router.get('/usersToTeams', async (req,res) => {
    try{
        let connection = await sql.connect(config);
        const users_result = await connection.request().query(`SELECT * FROM Users WHERE Id != 1008`);
        const teams_result = await connection.request().query(`SELECT * FROM Teams`);

        if (req.session.isAdmin == true) {
            res.render('assigneUsersToTeams', 
            {userList: users_result.recordset, TeamsList:teams_result.recordset});
        } else {
            res.render('error_page');
        }
    }
    catch(err)
    {
        console.log(err);
    }
});

router.post('/usersToTeams', async function(req, res, next) {
    try {
        // Put team into the Sql server
        const pool = await sql.connect   (config);

        const result = await pool.request()
        .input("UserId", sql.Int, req.body.UserId)
        .input("TeamId", sql.Int, req.body.TeamId)
        .query("INSERT INTO UsersTeams (UsersId, TeamsId) VALUES (@UserId, @TeamId)");
        console.log(result)

    } catch (err) {
        console.log(err);
    }

    res.redirect("/usersToTeams");
});

module.exports = router;