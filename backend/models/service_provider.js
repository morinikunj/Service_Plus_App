const { default: mongoose } = require("mongoose");
const Wallet = require("./wallet");


const ratingSchema = new mongoose.Schema({
  rating: { type: Number, required: true },
  comment: String,
  userName: { type: String, required: true }, // Name of the user who provided the rating
  userImage: String // Image of the user who provided the rating
});


const serviceProviderSchema = new mongoose.Schema({
    name: { type: String, },
    email: { type: String, },
    phoneNumber: { type: String, default: ""},
    service: { type: String, default: "" },
    serviceLocation: { type: String, default:""},
    charge: {
      amount: { type: Number, default: 0},
      per: { type: String, enum: ['hour', 'day', 'one-time'], default: "hour" }
    },
    image: { type: String, default: "https://th.bing.com/th/id/OIP.7tJu_Vr2oivSc-Q1UNN6OgAAAA?w=474&h=502&rs=1&pid=ImgDetMain"},// Assuming image is stored as a URL
    ratings: [ratingSchema], // Embed ratings within the service provider schema
    averageRating: { type: Number, default: 0 }
  });

  
  
  // Mongoose model
  const ServiceProvider = mongoose.model('ServiceProvider', serviceProviderSchema);
  
  module.exports = ServiceProvider;