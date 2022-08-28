const app = require('./app');
const { connect } =require('./database');

async function main(){
    //conexion a base de datos de mascotas
    await connect();
    //aplicacion express
    await app.listen(4000);
    console.log("Servidor escuchando puerto 4000: conectado");
}
main();