require('dotenv').config();
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const saltRounds = 12;

const whiteSpaceRegex = /^\s*$/
const validImageTypes = ['image/jpeg', 'image/png'];    // for file validation
const validPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{12,64}$/;
const validEmailRegex = /^[a-zA-Z0-9]+(?:[_.-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}$/; //replace with your own regex
const phoneNumber = /^0{0,1}9[0-9]{9}$/;
const scriptRegex = /^[a-zA-Z0-9_ ]+$/

const limiter = rateLimit({ // counts failed login attempts
    windowMs: 15 * 60 * 1000, // 15 minutes before reset
    max: 5, // up to 5 attempts only
    message: (req, res, next) => {
        // Calculate the remaining time until the window resets
        const resetTime = Math.ceil((req.rateLimit.resetTime - Date.now()) / 1000 / 60);
        const message = `Too many login attempts, try again in ${resetTime} minutes`;
        
        // Pass the dynamic message to the response
        res.status(429).send(message);
    },
    skipSuccessfulRequests: true
});

const imageSignatures = {
    'JPEG': '\xFF\xD8\xFF',
    'PNG': '\x89\x50\x4E\x47\x0D\x0A\x1A\x0A'
}

router.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/login');
});

router.post('/logout', (req, res) => {
    try {
        log("Destroyed previous session");
        logAuthentication(req.session.user.id, 'Log Out');
    } catch (error) {
        errorLog(error)
    } finally {
        req.session.destroy();
        res.redirect('/login');
    }
});