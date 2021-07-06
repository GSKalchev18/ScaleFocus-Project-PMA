const express = require('express');
const sql = require('mssql/msnodesqlv8');
const app = express();
const PORT = process.env.PORT || 5500;

let users_list_router = require('./routers/users_list');

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.json());

app.use('/', users_list_router);

app.listen(PORT, function(req, res) {
    console.log(`Server is running on port ${PORT}`);
})
