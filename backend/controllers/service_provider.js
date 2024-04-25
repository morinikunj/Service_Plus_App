const ServiceProvider = require("../models/service_provider");
const User = require("../models/users");
const Wallet = require("../models/wallet");

const spProfileDetails =  async (req, res) => {
  try {
    const { email,} = req.params;

    // Fetch user profile from the database by email
    const userProfile = await ServiceProvider.findOne({email});
    // Check if user profile exists
    if (!userProfile) {
      return res.status(404).json({ error: 'User profile not found' });
    }

    res.json(userProfile); // Return fetched user profile as JSON response
  } catch (error) {
    res.status(500).json({ error: error.message }); // Return error message if something goes wrong
  }
};


const updateProfileSp =  async (req, res) => {
  try {
    const {email} = req.params;
    const updatedDetails = req.body;
    const {name} = req.body;

    // Check if email parameter is provided
    if (!email) {
      return res.status(400).json({ error: 'User Id parameter is required' });
    }

    // Update user profile in the database
    const updatedProfile = await ServiceProvider.findOneAndUpdate({ email }, updatedDetails, {
      new: true, // Return the updated document
      runValidators: true // Run schema validators
    });

    const user = User.findOne({email});
    user.name = name;
    user.email = email;
    await user.save();

    // Check if user profile exists
    if (!updatedProfile) {
      return res.status(404).json({ error: 'User profile not found' });
    }

    res.json({
      msg: 'Profile updated successfully.'
    }); // Return updated user profile as JSON response
  } catch (error) {
    res.status(500).json({ error: error.message }); // Return error message if something goes wrong
  }
};

const getAllServiceProviderDetails =  async (req, res) => {
  try {
    // Fetch user profile from the database by email
    const userProfile = await ServiceProvider.find();
    // Check if user profile exists
    if (!userProfile) {
      return res.status(404).json({ error: 'User profile not found' });
    }

    res.json(userProfile); // Return fetched user profile as JSON response
  } catch (error) {
    res.status(500).json({ error: error.message }); // Return error message if something goes wrong
  }
};

module.exports = {
  spProfileDetails,
  updateProfileSp,
  getAllServiceProviderDetails
}