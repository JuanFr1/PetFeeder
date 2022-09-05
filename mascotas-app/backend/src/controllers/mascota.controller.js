const petService = require('../services/mascota.service');

const consultarMascotas = async(req, res) =>{

    res.json({
        mascotas: await petService.consultarMascotas()
    });
}

const agregarMascotas = async(req,res) =>{
    console.log(req.body);

    res.json({
        mascota: await petService.agregarMascotas(req.body)
    });
}
const eliminarMascotas = async(req,res) => {

    res.json({
        mascota: await petService.eliminarMascotas(req.params.id)
    });
}

const modificarMascotas = async(req,res) => {
    res.json({
        mascota: await petService.modificarMascotas(req.body)
    })
}

module.exports = {consultarMascotas, agregarMascotas, eliminarMascotas, modificarMascotas};

