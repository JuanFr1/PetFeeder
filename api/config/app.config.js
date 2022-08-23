 
 const mongoose = require('mongoose')
 const DB = "mongodb://localhost:27017/PetFeeder"


 module.exports = () => {
     const connect = () => {
        mongoose.connect(
            DB,{
                keepAlive: true,
                useNewUrlParser: true,
                useUnifiedTopology: true
            },(error) => {
                if(error) {
                    console.log('DB : ERROR')
                }else {
                    console.log('conexion correcta!!!')
                }
            }

        )
     }
     connect();
 };