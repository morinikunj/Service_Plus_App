// Create a new booking
const bookService = async (req, res) => {
    try {
      const { serviceProviderId, userId, serviceProviderName, userName, bookingDate, bookingTime, status, charge } = req.body;
  
      // Perform any additional checks or validations here...
  
      // Create a new booking
      const booking = await Booking.create({
        serviceProviderId,
        userId,
        serviceProviderName,
        userName,
        bookingDate,
        bookingTime,
        status,
        charge
      });
  
      res.json(booking);
    } catch (err) {
      res.status(400).json({ error: err.message });
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