const Category = require("../models/category");

const addCategory = async (req, res) => {
    try {
        const { name, imageUrl } = req.body;
    
        // Create a new category document
        const newCategory = new Category({
          name,
          imageUrl
        });
    
        // Save the category to the database
        await newCategory.save();
    
        res.status(201).json(newCategory);
      } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
      }
}



module.exports = {
    addCategory
};