const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');
const {UserRepositories} = require('../repositories/users');

let router = express.Router();

let users = new UserRepositories();

router.get('/users', async (req, res) => {
    try{
        let connection = await sql.connect(config);
        const users_result = await connection.request().query(`SELECT * FROM Users WHERE Id != 1008`);

        if (req.session.isAdmin == true) {
            res.render('users_list', 
            {userList: users_result.recordset});
        } else {
            res.render('error_page');
        }
    }
    catch(err)
    {
        console.log(err);
    }
})

module.exports = router;