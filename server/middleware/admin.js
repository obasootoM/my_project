const jwt = require("jsonwebtoken");
const User = require("../models/user");


const admin = async (req, res, next) => {
   try{
     const token = req.header('x-auth-token')
     if (!token)
     res.status(401).json({msg:"No auth token,access denied"});
     const verified =jwt.verify(token, "passwordKey");
     if (!verified)
     res.statue(401).json({msg:"token verification failed"});
     const user = await User.findById(verified.id);
     if (user.type == 'user' || user.type == 'seller') {
      return res.status(401).json({msg:'you are not an admin'});
     }
     res.user = verified.id
     res.token = token
     next();
   }catch(e){
      res.status(500).json({e:e.message});
   }
}

module.exports = admin;