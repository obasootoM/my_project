const express = require("express");
const adminRoute = express.Router();
const admin = require("../middleware/admin");
const Product = require("../models/product");


adminRoute.post("/admin/add-product", admin, async (req, res) => {
  try{
      const {name,description, price, category,images, quantity} = req.body;

      let product = new Product({
           name,
           description,
           price,
           category,
           images,
           quantity,
      });
      product = await product.save();
      res.json(product);
  }catch(e) {
     res.status(500).json({error: e.message});
  }

});

adminRoute.get("/admin/get-product",admin, async (req ,res) => {
  try{
   let product = await Product.find({});
   res.json(product);
  }catch(e) {
   res.status(500).json({error: e.message});
  }
})

adminRoute.delete("/admin/delete-product",admin, async (req, res) => {
  try{
   const {id} = req.body;
   let deleteProduct = await Product.findByIdAndDelete(id);
   res.json(deleteProduct);
  }catch(e) {
    res.status(500).json({error: e.message});
  }
})

module.exports = adminRoute;