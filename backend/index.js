const express = require("express");
const connectdb = require("./db_connection");
const authRouter = require("./routes/auth");
const profileRouter = require("./routes/user_profile");
const walletRouter = require("./routes/wallet");
const adminRouter = require("./routes/admin");

//initialize
const app = express();
const PORT = 3000;

//middleware
app.use(express.json());
app.use(authRouter);
app.use(profileRouter);
app.use(walletRouter);
app.use(adminRouter);

//database connection
connectdb();

app.listen(PORT, "0.0.0.0", () => {
   console.log("START SERVER.....");
})