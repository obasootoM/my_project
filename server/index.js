const express = require("express");
const mongoose = require('mongoose');
const PORT = 3000;

const authRoute = require("./route/auth_route");
const adminRoute = require("./route/admin_route");
const productroute = require("./route/product_route");

//init
const app = express();
const DB = "mongodb+srv://onyearugbulem:obasooto@cluster0.nye1abz.mongodb.net/?retryWrites=true&w=majority";
//create API

//create req method such as post, get, update, delete
//
app.use(express.json());
app.use(authRoute);
app.use(adminRoute);
app.use(productroute);


//connection to database
 mongoose
 .connect(DB)
 .then(() => {
    console.log("connection successful")
 }).catch((e) => {
    console.log(e);
 });
 //localhost
app.listen(PORT, "0.0.0.0", () => {
    console.log(`connect at port ${PORT} `)
});

