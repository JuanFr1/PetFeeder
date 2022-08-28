const {Schema, model } = require('mongoose');

const petSchema = new Schema({
    petName: String,
    petAge: String,
    petWeight: String,
    raze: String,
    color: String,
    avatar: String

});

module.exports = model('Mascota', petSchema);