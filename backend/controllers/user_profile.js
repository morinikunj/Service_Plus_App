const UserProfile = require("../models/user_profile");
const User = require("../models/users");
const Wallet = require("../models/wallet");

const userProfileDetails =  async (req, res) => {
    try {
      const { email,} = req.params;
  
      // Fetch user profile from the database by email
      const userProfile = await UserProfile.findOne({email});
      // Check if user profile exists
      if (!userProfile) {
        return res.status(404).json({ error: 'User profile not found' });
      }
  
      res.json(userProfile); // Return fetched user profile as JSON response
    } catch (error) {
      res.status(500).json({ error: error.message }); // Return error message if something goes wrong
    }
  };

  const updateProfile =  async (req, res) => {
    try {
      const updatedDetails = req.body;
      const {name, email} = req.body;
  
      // Check if email parameter is provided
      if (!email) {
        return res.status(400).json({ error: 'User Id parameter is required' });
      }
  
      // Update user profile in the database
      const updatedProfile = await UserProfile.findOneAndUpdate({ email }, updatedDetails, {
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

  const addAddressDetails =  async (req, res) => {
    try {
      const { email } = req.params;
      const { title, addressLine } = req.body;
  
      // Check if email parameter is provided
      if (!email) {
        return res.status(400).json({ error: 'email parameter is required' });
      }
  
      // Check if title and addressLine are provided
      if (!title || !addressLine) {
        return res.status(400).json({ error: 'Title and address line are required' });
      }
  
      // Find user profile by email
      const userProfile = await UserProfile.findOne({email});
  
      // Check if user profile exists
      if (!userProfile) {
        return res.status(404).json({ error: 'User profile not found' });
      }
  
      // Add new address to user profile
      userProfile.addresses.push({ title, addressLine });
  
      // Save user profile with new address
      await userProfile.save();
  
      res.json({
        msg: "Address added successfully."
      }); // Return updated user profile as JSON response
    } catch (error) {
      res.status(500).json({ error: error.message }); // Return error message if something goes wrong
    }
  };

  // Define API endpoint to update address in user profile by email and address id
const updateAddress = async (req, res) => {
    try {
      const { email, addressId } = req.params;
      const { title, addressLine } = req.body;
  
      // Check if email and addressId parameters are provided
      if (!email || !addressId) {
        return res.status(400).json({ error: 'email and addressId parameters are required' });
      }
  
      // Check if title and addressLine are provided
      if (!title || !addressLine) {
        return res.status(400).json({ error: 'Title and address line are required' });
      }
  
      // Find user profile by email
      const userProfile = await UserProfile.findOne({ email });
  
      // Check if user profile exists
      if (!userProfile) {
        return res.status(404).json({ error: 'User profile not found' });
      }
  
      // Find the index of the address with the given addressId
      const addressIndex = userProfile.addresses.findIndex(address => address._id == addressId);
  
      // Check if address with the given addressId exists
      if (addressIndex === -1) {
        return res.status(404).json({ error: 'Address not found' });
      }
  
      // Update the address with the new details
      userProfile.addresses[addressIndex] = { _id: addressId, title, addressLine };
  
      // Save user profile with updated address
      await userProfile.save();
  
      res.json({
        msg: "Address updated successfully."
      }); // Return updated user profile as JSON response
    } catch (error) {
      res.status(500).json({ error: error.message }); // Return error message if something goes wrong
    }
  };

  const deleteAddress = async (req, res) => {
    try {
      const { email, addressId } = req.params;
  
      // Check if email and addressId parameters are provided
      if (!email || !addressId) {
        return res.status(400).json({ error: 'email and addressId parameters are required' });
      }
  
      // Find user profile by email
      const userProfile = await UserProfile.findOne({ email });
  
      // Check if user profile exists
      if (!userProfile) {
        return res.status(404).json({ error: 'User profile not found' });
      }
  
      // Find the index of the address with the given addressId
      const addressIndex = userProfile.addresses.findIndex(address => address._id == addressId);
  
      // Check if address with the given addressId exists
      if (addressIndex === -1) {
        return res.status(404).json({ error: 'Address not found' });
      }
  
      // Remove the address from the addresses array
      userProfile.addresses.splice(addressIndex, 1);
  
      // Save user profile with updated addresses (address removed)
      await userProfile.save();
  
      res.json({
        msg: "Address deleted successfully."
      }); // Return updated user profile as JSON response
    } catch (error) {
      res.status(500).json({ error: error.message }); // Return error message if something goes wrong
    }
  };
  
  
  
  module.exports = {
    userProfileDetails,
    updateProfile,
    addAddressDetails,
    updateAddress,
    deleteAddress
  };