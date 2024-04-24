const Category = require("../models/category");

const addCategory = async (req, res) => {
    try {
        const { name, image } = req.body;
    
        // Create a new category document
        const newCategory = new Category({
          name,
          image
        });
    
        // Save the category to the database
        await newCategory.save();
    
        res.json({msg: name+" category added successfully."});
      } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
      }
}

const getCategory = async (req, res) => {
  try {
   

    res.json({msg: " category added successfully."});
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}



module.exports = {
    addCategory
};