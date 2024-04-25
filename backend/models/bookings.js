const { default: mongoose } = require("mongoose");

// Mongoose schema for charge
const chargeSchema = new mongoose.Schema({
    amount: { type: Number, required: true },
    per: { type: String, enum: ['hour', 'day', 'one-time'], required: true }
  });
  
  // Mongoose schema for booking
  const bookingSchema = new mongoose.Schema({
    serviceProviderId: { type: mongoose.Schema.Types.ObjectId, ref: 'ServiceProvider', required: true },
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    serviceProviderName: { type: String, required: true },
    userName: { type: String, required: true },
    bookingDate: { type: Date, required: true },
    bookingTime: { type: String, required: true },
    status: { type: String, enum: ['requested', 'received', 'confirmed', 'started', 'completed', 'cancelled'], default: 'requested' },
    charge: { type: chargeSchema, required: true },
    createdAt: { type: Date, default: Date.now },
  });
  
  // Mongoose model for booking
  const Booking = mongoose.model('Booking', bookingSchema);
  
  module.exports = bookingSchema;