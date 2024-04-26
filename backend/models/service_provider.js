const { default: mongoose } = require("mongoose");
const Wallet = require("./wallet");


const ratingSchema = new mongoose.Schema({
  rating: { type: Number, required: true },
  comment: String,
  userName: { type: String, required: true }, // Name of the user who provided the rating
  userImage: String // Image of the user who provided the rating
});


const serviceProviderSchema = new mongoose.Schema({
    name: { type: String,},
    email: { type: String,},
    phoneNumber: { type: String, default: ""},
    service: { type: String,},
    serviceLocation: { type: String, default:""},
    charge: {
      amount: { type: Number, default: 0},
      per: { type: String, enum: ['hour', 'day', 'one-time'], default: "hour" }
    },
    image: { type: String, default: ""},// Assuming image is stored as a URL
    ratings: [ratingSchema], // Embed ratings within the service provider schema
    averageRating: { type: Number, default: 0 }
  });
  
  // Mongoose model
  const ServiceProvider = mongoose.model('ServiceProvider', serviceProviderSchema);
  
  module.exports = ServiceProvider;