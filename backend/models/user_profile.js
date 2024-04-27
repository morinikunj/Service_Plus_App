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
    default: "https://th.bing.com/th/id/OIP.7tJu_Vr2oivSc-Q1UNN6OgAAAA?w=474&h=502&rs=1&pid=ImgDetMain"
  },
  mobileNo: {
    type: String,
    default: ""
  },
  addresses: [addressSchema],
});

const UserProfile = mongoose.model('UserProfile', userProfileSchema);

module.exports = UserProfile;
