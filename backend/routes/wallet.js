const express = require('express');
const { walletBalance, addFunds, deductFund } = require('../controllers/wallet');

const walletRouter = express.Router();

walletRouter.get('/wallet/:email', walletBalance);

walletRouter.post("/wallet/:email/add-funds", addFunds);

walletRouter.post("/wallet/:email/deduct-funds", deductFund);


module.exports = walletRouter;