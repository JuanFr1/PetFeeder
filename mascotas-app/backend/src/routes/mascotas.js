const { Router } = require('express');

const router = Router();

const faker = require('faker');
const Pet = require('../models/Mascota');




router.get('/api/mascotas', async (req,res) => {
    const pets = await Pet.find();
    res.json({pets});
    
});

router.get('/api/mascotas/create', async (req,res) => {
        await Pet.create({
            petName: "Holly",
            petAge: "6 meses",
            petWeight: " 3 kg",
            raze: "Gato",
            color: "Blanco",
            avatar: "https://t1.ea.ltmcdn.com/es/posts/7/3/2/razas_de_gatos_blancos_lista_completa_24237_600.jpg"
        });
    
    res.json({message: "1 mascotas creadas"});
});
module.exports = router;