const mongoose = require('mongoose');

const notificationMessage = new mongoose.Schema({
    title: {
        type: String,
        required: true
      },
      body: {
        type: String,
        required: true
      },
      sentAt: {
        type: Date,
        default: Date.now
      }
});

const notificationSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  token: {
    type: String,
    required: true
  },
  notificationMessages: [notificationMessage]
 
});

const Notification = mongoose.model('Notification', notificationSchema);

module.exports = Notification;
