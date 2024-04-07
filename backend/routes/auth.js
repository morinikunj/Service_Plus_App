const express = require('express');
const { signUp, signIn, tokenIsValid, changePassword } = require('../controllers/user');
const auth = require('../middlewares/auth');

const authRouter = express.Router();

// signup
authRouter.post("/signup", signUp);

// sign in
authRouter.post("/signin", signIn);

//token valid
authRouter.post("/tokenIsValid", tokenIsValid);

  //change password
 authRouter.post("/ChangePassword", auth, changePassword);




module.exports = authRouter;