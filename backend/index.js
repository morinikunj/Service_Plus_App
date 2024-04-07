const express = require("express");
const connectdb = require("./db_connection");
const authRouter = require("./routes/auth");

//initialize
const app = express();
const PORT = 3000;

//middleware
app.use(express.json());
app.use(authRouter);

//database connection
connectdb();

app.listen(PORT, "0.0.0.0", () => {
   console.log("START SERVER.....");
})