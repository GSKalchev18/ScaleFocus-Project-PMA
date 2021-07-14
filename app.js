const express = require('express');
const sql = require('mssql/msnodesqlv8');
const app = express();
const PORT = process.env.PORT || 5500;

let session = require('express-session')

let users_list_router = require('./routers/users_list');
let teams_list_router = require('./routers/teams_list');
let user_registration_router = require('./routers/user_register');
let login_page_router = require('./routers/login');
let user_edit_router = require('./routers/edit_user');
let user_delete_router = require('./routers/delete_user');
let team_registration_router = require('./routers/team_register');
let userToTeam_router = require('./routers/usersToTeams');

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}))

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.json());

app.get('/register', function(req,res){
    res.render('register_page');
});

app.use('/', users_list_router);
app.use('/', teams_list_router);
app.use('/', user_registration_router);
app.use('/', login_page_router);
app.use('/', user_edit_router);
app.use('/', user_delete_router);
app.use('/', team_registration_router);
app.use('/', userToTeam_router);

app.get('/', function(req,res)
{
    res.render('index');
});

app.get('/homepage', function(req,res)
{
    res.render('homepage');
});

// Catch 404 and forward to error handler
app.use('*', function(req, res, next) {
    next(createError(404));
});

// Error handler
app.use(function(err, req, res, next) {
    // Set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // Render the error page
    res.status(err.status || 500);
    res.render('error_page');
});

app.listen(PORT, function(req, res) {
    console.log(`Server is running on port ${PORT}`);
})
