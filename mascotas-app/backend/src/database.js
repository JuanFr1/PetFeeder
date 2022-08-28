const mongoose = require('mongoose');

async function connect(){
    await mongoose.connect('mongodb://localhost/datos-mascotas', {
        useNewUrlParser: true
    });
    console.log('Database: Connected');
};

module.exports = { connect };