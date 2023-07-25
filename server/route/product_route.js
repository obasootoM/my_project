const express = require('express');
const productroute = express.Router();
const auth = require('../middleware/auth');
const Product = require('../models/product');


productroute.get("/api/get-product",auth, async (req, res) => {
    try{
      // console.log(req.query.category);
       let products = await Product.find({category: req.query.category});
       res.json(products);
    }catch(e) {
     res.status(500).json({error:e.message});
    }
})


productroute.get("/api/product/search/:name", auth, async (req, res) => {

  try{
    let product = await Product.find({
       name: {$regex: req.params.name, $options: "i"}
    });
    res.json(product);
  }catch(e) {
    res.status(500).json({error: e.message});
  }
})

module.exports = productroute;