// Import Mongoose
const mongoose = require('mongoose');

const transactionSchema = new mongoose.Schema({
  type: { type: String, enum: ['add', 'payment'], required: true }, // "add" or "payment"
  description: { type: String, required: true },
  amount: { type: Number, required: true },
  recipient: { type: String }, // Name of the person receiving the payment
  date: { type: Date, default: Date.now }
});


const walletSchema = new mongoose.Schema({
    email: {
      type: String,
      ref: "User",
      required: true
    },
    balance: {
      type: Number,
      default: 0
    },
    transactions: [transactionSchema]
  });

  const Wallet = mongoose.model('Wallet', walletSchema);

module.exports = Wallet;