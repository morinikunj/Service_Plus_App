const express = require('express');
const {userProfileDetails, updateProfile, addAddressDetails, updateAddress, deleteAddress} = require('../controllers/user_profile');

const profileRouter = express.Router();

profileRouter.get("/user_profile/:email", userProfileDetails);

profileRouter.put("/update_profile", updateProfile);

profileRouter.post("/add_address/:email", addAddressDetails);

profileRouter.put('/update_address/:email/:addressId', updateAddress);

profileRouter.delete('/delete_address/:email/:addressId', deleteAddress);

module.exports = profileRouter;
