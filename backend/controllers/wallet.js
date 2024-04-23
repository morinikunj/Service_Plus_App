const Wallet = require("../models/wallet");

  // Define API endpoint to get user's wallet balance
  const walletBalance = async (req, res) => {
    try {
      const { email} = req.params;
  
      // Find wallet by user ID
      const wallet = await Wallet.findOne({ email });
  
      // Check if wallet exists
      if (!wallet) {
        return res.status(404).json({ error: 'Wallet not found' });
      }
  
      res.json({ balance: wallet.balance }); // Return wallet balance as JSON response
    } catch (error) {
      res.status(500).json({ error: error.message }); // Return error message if something goes wrong
    }
  };
  
  // Define API endpoint to add funds to user's wallet
  const addFunds =  async (req, res) => {
    try {
      const { email } = req.params;
      const { amount } = req.body;
  
      // Find wallet by user ID
      const wallet = await Wallet.findOne({ email });
  
      // Check if wallet exists
      if (!wallet) {
        return res.status(404).json({ error: 'Wallet not found' });
      }
  
      // Add funds to wallet balance
      wallet.balance += amount;
  
      // Save wallet with updated balance
      await wallet.save();
  
      res.json({ msg : "Funds added successfully.",balance: wallet.balance }); // Return updated wallet balance as JSON response
    } catch (error) {
      res.status(500).json({ error: error.message }); // Return error message if something goes wrong
    }
  };
  
  // Define API endpoint to deduct funds from user's wallet
  const deductFund = async (req, res) => {
    try {
      const { email } = req.params;
      const { amount } = req.body;
  
      // Find wallet by user ID
      const wallet = await Wallet.findOne({ email });
  
      // Check if wallet exists
      if (!wallet) {
        return res.status(404).json({ error: 'Wallet not found' });
      }
  
      // Check if sufficient balance
      if (wallet.balance < amount) {
        return res.status(400).json({ error: 'Insufficient balance' });
      }
  
      // Deduct funds from wallet balance
      wallet.balance -= amount;
  
      // Save wallet with updated balance
      await wallet.save();
  
      res.json({msg: "Payment successful.", balance: wallet.balance }); // Return updated wallet balance as JSON response
    } catch (error) {
      res.status(500).json({ error: error.message }); // Return error message if something goes wrong
    }
  };

  module.exports = {
    walletBalance,
    addFunds,
    deductFund
  };
  