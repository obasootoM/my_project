const express = require("express");
const User = require("../models/user");
const authRoute = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const auth = require("../middleware/auth")


//signup user
authRoute.post("/api/signup", async (req, res) => {
    try{
         const {name,email,password} = req.body;  //request params
         //get user request
         const existingUser = await User.findOne({email});
         if (existingUser) {
            return res.status(400).json({msg:"user already exist"});
         }

         const hashPassword = await bcrypt.hash(password, 8)  //encrypt password
         let user = new User({
            name,
            email,
            password: hashPassword,
         });
         user = await user.save();
         res.json(user);
    }catch(e) {
         res.status(500).json({error:e.message}); //internalServerError
    }
});
//sign in user
authRoute.post('/api/signIn', async (req, res) => {
    try{
       const {email,password} = req.body;
       const user = await User.findOne({email});
       if (!user) {  //check if user is null
         return res.
         status(400).json({msg:"user with this email does not exit!"})
       }
       const imatch = await bcrypt.compare(password, user.password) //check if user password match
        if (!imatch) {
        return res.status(400).json({msg:"incorrect password"})
        }
        const token = jwt.sign({id:user._id},"passwordKey");
        res.json({token, ...user._doc});

    }catch(e) {
       res.status(500).json({error:e.message});
    }
})

//get user token
authRoute.post("/tokenIsVerified", async (req, res) => {
    try{
         const token = req.header("x-auth-token"); //if header is of type token
         if (!token) return res.json(false); //return false
         const verified =jwt.verify(token, "passwordKey"); //if jwt is verified
         if (!verified) return res.json(false);//else return false
         const user = await User.findById(verified.id); //
         if (!user) return res.json(false);
         res.json(true);
    }catch(e) {
         res.status(500).json({error:e.message}); //internalServerError
    }
});
// get users data
 authRoute.get("/", auth, async (req, res) => {

   const user = await User.findById(req.user);
   res.json({token:req.token, ...user});
   //res.json({token, ...user._doc});
 });
 module.exports = authRoute;