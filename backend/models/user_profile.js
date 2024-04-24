const mongoose = require('mongoose');

const addressSchema = new mongoose.Schema({
  title: String,
  addressLine: String
});

const userProfileSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  email: {
    type: String,
    required: true,
    unique: true
  },
  profileImg: {
    type: String,
    default: ""
  },
  mobileNo: {
    type: String,
    default: ""
  },
  addresses: [addressSchema]
});

const UserProfile = mongoose.model('UserProfile', userProfileSchema);

module.exports = UserProfile;
