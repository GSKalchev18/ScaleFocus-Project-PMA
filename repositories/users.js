const express = require('express');
const {config} = require('../config/database_config');
const sql = require('mssql/msnodesqlv8');

let router = express.Router();

class UserRepositories{

    constructor()
    {
        
    }

    async getAllUsers(){
        try{
            let connection = await sql.connect(config);
            const users_result = await connection.request().query(`SELECT * FROM Users`);

            router.get('/users', function(req, res) {
                if (req.session.isAdmin == true) {
                    res.render('users_list', 
                    {userList: users_result.recordset});
                } else {
                    res.render('error_page');
                }
            });
        }
        catch(err)
        {
            console.log(err);
        }
    }

}

exports.UserRepositories = UserRepositories;