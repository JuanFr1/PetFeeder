const mongoose = require('mongoose');

const cupon = mongoose.model(
    "cupones",
    mongoose.Schema({
        cuponName: String,
        cuponLocal: String,
        cuponFecha: String,
        cuponBeneficio: String,
        cuponCodigo: String,
        cuponCategoria: String,
    },{
        timestamps : true,
    })
);

module.exports = {
    cupon
}