require('dotenv').config();
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const saltRounds = 12;

const rateLimit = require('express-rate-limit');

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

router.get('/', (req, res) => {
    res.redirect('/login');
});


router.get('/login', (req, res) => {
    // Doesn't store cache to avoid pressing back button even after login/logout
    res.setHeader('Cache-Control', 'no-store, must-revalidate');

    if (req.session.user) {
        res.redirect('/dashboard');
    } else {
        res.render('login');
    }
});

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

module.exports = router;