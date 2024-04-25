const ServiceProvider = require("../models/service_provider");

const rating = async (req, res) => {
    try {
      const {email} = req.params;
      const { rating, comment , userName,  userImage} = req.body;
  
      const serviceProvider = await ServiceProvider.findOne({email});
      if (!serviceProvider) {
        return res.status(404).json({ error: 'Service provider not found' });
      }
  
      // Add the new rating to the ratings array
      serviceProvider.ratings.push({ rating, comment , userName,  userImage});
  
      // Recalculate average rating
      const totalRatings = serviceProvider.ratings.length;
      const totalRatingSum = serviceProvider.ratings.reduce((sum, current) => sum + current.rating, 0);
      serviceProvider.averageRating = totalRatings > 0 ? totalRatingSum / totalRatings : 0;
  
      await serviceProvider.save();
  
      res.status(201).json(serviceProvider.ratings);
    } catch (err) {
      res.status(400).json({ error: err.message });
    }
  };


  // Get all ratings for a service provider
const getRating = async (req, res) => {
    try {
      const email = req.params.email;
      const serviceProvider = await ServiceProvider.findById(email);
      if (!serviceProvider) {
        return res.status(404).json({ error: 'Service provider not found' });
      }
      res.json(serviceProvider.ratings);
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  };

  module.exports = {
   rating,
   getRating
  }
  