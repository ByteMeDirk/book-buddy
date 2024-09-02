const express = require('express');

//this is where we do the validation
//body are the feilds you send to the server to do the check or block users
const { body } = require('express-validator');

const router = express.Router();

const User = require("../models/user");
const authController = require('../controllers/auth');

//This section valiates the form for the signup page, name will be username for us. The name email and password come from the express validator package
router.post(
  "/signup",
  [
    body("username").trim().not().isEmpty(),
    body("email")
      .isEmail()
      .withMessage("Please enter a valid email.")
      //the custom function below checks for duplicate emails. It asks the process to wait until it recieves a response from the user.find method. if the response is greater than 0 it rejects the email parameter and throws an error
      .custom(async (email) => {
        const user = await User.find(email);

        if (user[0].length > 0) {
    
          return Promise.reject("Email address already exists!");

        }
 
      })
      .normalizeEmail(),
    body("password_hash").trim().isLength({ min: 7 }),
  ],
  
  authController.signup
);

// router.post('/login', authController.login);
  
  
  module.exports = router;
