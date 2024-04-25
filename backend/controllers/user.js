const User = require("../models/users");
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const UserProfile = require("../models/user_profile");
const Wallet = require("../models/wallet");
const ServiceProvider = require("../models/service_provider");

//sign up
const signUp = async (req, res) => {
    try {
     const {name, email, password, type} = req.body;
    const existingUser = await User.findOne({email});
    if (existingUser) {
        return res.status(400).json({
            error: "User is already exists!"
        });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({name, email, password : hashedPassword, type});
    user = await user.save();

    if(type == "service_provider"){
        let sp = new ServiceProvider({name, email});
        await sp.save();
    } else {
        let userProfile = new UserProfile({name, email});
         await userProfile.save();
    }
    let userId = user._id;
    let wallet = new Wallet({userId});
    await wallet.save();
    
    return res.json(user);
    } catch (e) {
        return res.status(500).json({error: e.message});
    }

};

// sign in
const signIn = async (req, res) => {
    try {
        const {email, password} = req.body;
    
        
        const user = await User.findOne({email});
        if (!user) {
            return res.status(400).json({ error: "User does not exists!"});
        }

        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ error: "Incorrect password!"});
        }
        const token = jwt.sign({id: user._id}, "passwordKey");

        return res.json({token, ...user._doc});

    } catch (e) {
         res.status(500).json({error: e.message});
    }
};

//token is valid 
const tokenIsValid = async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const user = await User.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  };

  //change password
  const changePassword = async (req, res) => {
    try {
        const {email, oldPassword, newPassword } = req.body;
        
        const user = await User.findOne({email});
        const isMatch = await bcryptjs.compare(oldPassword, user.password);
        if (!isMatch) {
            return res.status(400).json({ error: "Old password is incorrect!"});
        }
          
        const hashedPassword = await bcryptjs.hash(newPassword, 8);
        user.password = hashedPassword; //update
        await user.save();
        res.json({ msg: "Password updated successfully."})
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
  };


module.exports = {
    signUp,
    signIn,
    tokenIsValid,
    changePassword
};