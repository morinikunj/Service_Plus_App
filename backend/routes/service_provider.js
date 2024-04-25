const express = require('express');
const { spProfileDetails, updateProfileSp, getAllServiceProviderDetails } = require('../controllers/service_provider');

const providerRouter = express.Router();

providerRouter.get("/service_provider/user_profile/:email", spProfileDetails);

providerRouter.put("/service_provider/update_profile", updateProfileSp);

//get all service providers 
providerRouter.get("/service_providers", getAllServiceProviderDetails);

module.exports =providerRouter;