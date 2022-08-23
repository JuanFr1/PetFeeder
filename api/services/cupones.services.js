const {cupon} = require("../models/cupones.models");

async function createcupones(params, callback){
    if(!params.cuponName){
        return callback(
            {
                message: "cupon Name Required",
            },
            ""
        );
    }

    const Cupon = new cupon(params);
    Cupon
    .save()
    .then((response) => {
        return callback(null, response);
    })
    .catch((error) => {
        return callback(error);
    });
}

async function getcupones(params, callback){
    const cuponName = params.cuponName;
    var condition = cuponName 
    ? {
        cuponName: { $regex : new RegExp(cuponName), $option: "i"},
    }
    : {};

    cupon
    .find(condition)
    .then((response) => {
        return callback(null, response);
    })
    .catch((error) => {
        return callback(error);
    });
}



module.exports = {
    createcupones,
    getcupones,
}