const express = require('express');
const { rating, getRating } = require('../controllers/rating');

const rateRouter = express.Router();

rateRouter.post('/rating/:email', rating);

 // Get all ratings for a service provider
 rateRouter.get("/get_ratings/:email", getRating);


module.exports = rateRouter;