const express = require("express");
const adminRoute = express.Router();
const admin = require("../middleware/admin");
const product = require("../models/product");


adminRoute.post("/admin/add-product", admin, async (req,res) => {
  try{
      const {name,description, price, category, quantity, images} = req.body;

      let product = new Product({
           name,
           description,
           price,
           product,
           category,
           quantity,
           images
      });
      product = await product.save();
      res.json(product);
  }catch(e) {
     res.status(500).json({error:e.message});
  }

});

module.exports = adminRoute;