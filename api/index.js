const express = require('express');
const app = express();
const MONGO_DB_CONFIG = require('./config/app.config');
const errors = require("./middleware/errors.js");



app.use(express.json());
app.use('/uploads', express.static('uploads'));
app.use("/api", require("./routes/app.routes"));
app.use(errors.errorHandler);

//app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.listen(process.env.port || 4000, function(){
    console.log("Puerto 4000 en linea");
});

MONGO_DB_CONFIG()