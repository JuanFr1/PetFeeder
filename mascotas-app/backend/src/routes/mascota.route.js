const { Router } = require('express');
const {consultarMascotas, agregarMascotas, eliminarMascotas, modificarMascotas} = require('../controllers/mascota.controller');
const router = Router();


router.get('/api/mascotas', consultarMascotas);
router.post('/api/mascotas/create', agregarMascotas);
router.delete('/api/mascotas/delete/:id',eliminarMascotas);
router.put('/api/mascotas/update',modificarMascotas);


module.exports = router;