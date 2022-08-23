const cuponesController = require("../controllers/cupones.controller");

const express = require("express");
const router = express.Router();

router.post("/cupones", cuponesController.create);
router.get("/cupones", cuponesController.findAll);

module.exports = router;