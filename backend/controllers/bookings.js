const Booking = require("../models/bookings");
const Notification = require("../models/notification");

// Create a new booking
const bookService = async (req, res) => {
    try {
      const {address, serviceProviderId, userId, serviceProviderName, userName, bookingDate, bookingTime, status, charge } = req.body;
  
      // Perform any additional checks or validations here...
       console.log(userName);
      // Create a new booking
      // const booking = await Booking.create({
      //   serviceProviderId,
      //   userId,
      //   serviceProviderName,
      //   userName,
      //   bookingDate,
      //   bookingTime,
      //   status,
      //   charge,
      //   address
      // });

      let booking = new Booking({
        serviceProviderId,
        userId,
        serviceProviderName,
        userName,
        bookingDate,
        bookingTime,
        status,
        charge,
        address
      });

      console.log(booking);

      await booking.save();

      

    //   const token = await Notification.findOne({userId});
    //   const title = "Booking Request";
    //   const body = "Request is sended by "+userName;

    //    if (token != null) {
    //     Notification.notificationMessages.push({title, body});

    //     const message = {
    //       notification : {
    //           "title": title,
    //           "body": body
    //       },
    //       token: token.token
    //    };
  
    //    getMessaging().send(message).then((response) => {
    //     res.json({msg: "Notification send successfully."});
    // }).catch((e) => {
    //     res.status(500).json({ error: e });
    // })
    //    }
  
      res.json({
        "msg": "Booking request has been sent successfully"
      });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  };

 const getMyBooking =  async (req, res) => {
    try {
      const {userId} = req.params;
      const bookings = await Booking.find({userId});
      res.json(bookings);
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  };


  module.exports = {
    bookService,
    getMyBooking
  }