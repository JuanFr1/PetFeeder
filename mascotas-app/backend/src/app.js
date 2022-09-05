const express = require('express');
const morgan = require('morgan');
const app = express();

const cors = require('cors');

app.use(morgan('dev'));
app.use(cors());
app.use(express.urlencoded({extended: true}));
app.use(express.json());


app.use(require('./routes/mascota.route'));


module.exports = app;
