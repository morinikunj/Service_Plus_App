const express = require("express");
const connectdb = require("./db_connection");
const authRouter = require("./routes/auth");
const profileRouter = require("./routes/user_profile");
const walletRouter = require("./routes/wallet");
const adminRouter = require("./routes/admin");
const providerRouter = require("./routes/service_provider");
const rateRouter = require("./routes/rating");
const bookingRouter = require("./routes/booking");
const admin = require("firebase-admin");
const { applicationDefault } = require("firebase-admin/app");
// const serviceAccount = require("./serviceAccountKey.json");
const serviceAccount = require("./service-plus-dfa00-firebase-adminsdk-t5iw2-6961e3373b.json")

//initialize
const app = express();
const PORT = 3000;
const GOOGLE_CREDENTIAL = "service-plus-dfa00-firebase-adminsdk-t5iw2-6961e3373b.json";

//middleware
app.use(express.json());
app.use(authRouter);
app.use(profileRouter);
app.use(walletRouter);
app.use(adminRouter);
app.use(providerRouter);
app.use(rateRouter);
app.use(bookingRouter);

//database connection
connectdb();

//firebase
// admin.initializeApp({
//    credential: applicationDefault(),
//    projectId: "service-plus-dfa00"
// });

// process.env.GOOGLE_CREDENTIAL;



admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});


app.listen(PORT, "0.0.0.0", () => {
   console.log("START SERVER.....");
})