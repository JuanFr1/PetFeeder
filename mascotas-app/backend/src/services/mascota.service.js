const petModel = require('../models/mascota.model');

class PetService {
    PetService(){}

    async consultarMascotas(){
        try{

            return await petModel.find();

        }catch(error){
            return error;
        }
    }

    async agregarMascotas(mascota = new petModel()){
        try{
            var mascotaAgregada;
            await petModel.create(mascota).then((value) =>{
                mascotaAgregada = value;
            });
            return mascotaAgregada;

        }catch(error){
            console.log(error);
        }
    }

    async eliminarMascotas(idc){
        console.log(idc);
        var mascotaEliminada;
        try{
            await petModel.findOneAndRemove({
                _id: idc
            }).then((value) =>{
                mascotaEliminada = value;
            });

            return mascotaEliminada 
        }catch(error){
            console.log(error);
        }
    }

    async modificarMascotas(newMascota){
        var mascotaModificada;
        try{
            await petModel.findOneAndUpdate({
                _id: newMascota._id
            }, newMascota).then((value)=> {
            mascotaModificada = newMascota; 
        });
            return mascotaModificada;
        }catch(error){
            console.log(error);
        }

    }
}

module.exports = new PetService();