const express = require('express');
const { spProfileDetails, updateProfileSp, getAllServiceProviderDetails, getAllServiceProviderDetailsByCategory, changeStatus } = require('../controllers/service_provider');
const auth = require('../middlewares/auth');

const providerRouter = express.Router();

providerRouter.get("/service_provider/user_profile/:email", spProfileDetails);

providerRouter.put("/service_provider/update_profile/:email", updateProfileSp);

//get all service providers 
providerRouter.get("/service_providers/:service", getAllServiceProviderDetailsByCategory);4

providerRouter.put("/booking/:id", changeStatus);

module.exports =providerRouter;