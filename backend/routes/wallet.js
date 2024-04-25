const express = require('express');
const { walletBalance, addFunds, deductFund, transaction } = require('../controllers/wallet');

const walletRouter = express.Router();

walletRouter.get('/wallet/:email', walletBalance);

walletRouter.post("/wallet/transaction/:email", transaction);


module.exports = walletRouter;