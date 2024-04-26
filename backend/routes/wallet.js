const express = require('express');
const { walletBalance, addFunds, deductFund, transaction } = require('../controllers/wallet');

const walletRouter = express.Router();

walletRouter.get('/wallet/:userId', walletBalance);

walletRouter.post("/wallet/:userId/transaction", transaction);


module.exports = walletRouter;