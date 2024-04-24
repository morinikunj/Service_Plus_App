const express = require('express');
const { addCategory } = require('../controllers/admin');

const adminRouter = express.Router();

adminRouter.post("/add_category", addCategory);


module.exports = adminRouter;