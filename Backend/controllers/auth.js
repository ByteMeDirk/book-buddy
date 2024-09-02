//if you need to add more columns add them here, and on the user.js file
const { validationResult } = require('express-validator');

const bcrypt = require('bcryptjs');

const jwt = require('jsonwebtoken');

const User = require('../models/user');

exports.signup = async (req, res, next) => {
    const errors = validationResult(req);
    

    if (!errors.isEmpty()){ 
        const errorMessage = errors.array()[0].msg;
        return res.status(422).json({ message: errorMessage });
    }
    

    const username = req.body.username;
    const email = req.body.email;
    const password_hash = req.body.password_hash;
    try {
        const hashedPassword = await bcrypt.hash(password_hash, 12)

        const userDetails = {
            username: username,
            email: email,
            password_hash: hashedPassword
        }

        const result = await User.save(userDetails);

        res.status(201).json({ message: 'User Registered!'})

    } catch (err) {
        //What to do if there is an error
        if (!err.statusCode) {
            err.statusCode = 500;
            
            
        }
        next(err)
    }

};