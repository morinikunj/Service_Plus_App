// Import Mongoose
const mongoose = require('mongoose');

const walletSchema = new mongoose.Schema({
    email: {
      type: String,
      ref: "User",
      required: true
    },
    balance: {
      type: Number,
      default: 0
    }
  });

  const Wallet = mongoose.model('Wallet', walletSchema);

module.exports = Wallet;