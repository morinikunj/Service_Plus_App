const mongoose = require("mongoose");

const db = 'mongodb+srv://iamlearner102:iOwBLFT3ic2bmyBr@cluster0.kdwfeoq.mongodb.net/?retryWrites=true&w=majority';

//database connection
 const connectdb = async () => {
     try {
       await mongoose.connect(db).then(() => {
            console.log('Databse connected');
         }).catch((e) => {
            console.log(e);
         });
     } catch (error) {
        console.log(error);
     }
};
``
module.exports = connectdb;