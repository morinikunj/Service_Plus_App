const express = require("express");
const { bookService, getMyBooking } = require("../controllers/bookings");

const bookingRouter = express.Router();

bookingRouter.post('/book_service', bookService);

bookingRouter.get("/booking/:userId", getMyBooking)

module.exports = bookingRouter;