const express = require('express');
const { walletBalance, addFunds, deductFund, transaction } = require('../controllers/wallet');

const walletRouter = express.Router();

walletRouter.get('/wallet/:email', walletBalance);

walletRouter.post("/wallet/:email/transaction", transaction);


module.exports = walletRouter;