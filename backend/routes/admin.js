const express = require('express');
const { addCategory, getAllCategory } = require('../controllers/admin');

const adminRouter = express.Router();

adminRouter.post("/add_category", addCategory);

adminRouter.get("/get_categories", getAllCategory);


module.exports = adminRouter;