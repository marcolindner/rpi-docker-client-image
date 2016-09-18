'use strict';

const express = require('express');

const PORT = 8080;

// APP

const app = express();
app.use(express.static('dist'));
app.get('/', function(req, res) {
	res.sendFile(__dirname + "/" + "index.html");
});
app.listen(PORT);
console.log('Running on http://localhost:' + PORT);