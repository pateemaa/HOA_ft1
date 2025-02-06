require('dotenv').config();
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const multer = require('multer');

const saltRounds = 12;

const rateLimit = require('express-rate-limit');

const limiter = rateLimit({ // counts failed login attempts
    windowMs: 15 * 60 * 1000, // 15 minutes before reset
    max: 5, // up to 5 attempts only
    message: (req, res, next) => {
        const message = `Too many login attempts, try again later.`;
        
        // Pass the dynamic message to the response
        res.status(429).send(message);
    },
    skipSuccessfulRequests: true
});

// memory
const storage = multer.memoryStorage();
const upload = multer({
    storage: storage,
    limits: { fileSize: 10 * 1024 * 1024 }, // 10MB max
    fileFilter: (req, file, cb) => {
        if (!file) return cb(new Error("No file uploaded"), false);
        cb(null, true);
    }
});

// magic numbers
function isValidImage(buffer) {
    if (!buffer || buffer.length < 4) return false;

    const hex = buffer.toString('hex', 0, 4);
    const jpgSignatures = ['ffd8ffe0', 'ffd8ffe1', 'ffd8ffe2']; // jpg/jpeg
    const pngSignature = '89504e47'; // png

    return jpgSignatures.includes(hex) || hex === pngSignature;
}

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

router.get('/register', (req, res) => {
    res.render('register');
});

router.post('/register', upload.single('profile_picture'), async (req, res) => {
    res.setHeader('Cache-Control', 'no-store, must-revalidate');
    try {
        const user = {
            full_name: req.body.full_name,
            email: req.body.email,
            password: req.body.password,
            phone_number: req.body.phone_number
        }
        const profilePic = req.file;
        let errors = [];

        if (!profilePic) {
            errors.push("Please include a profile picture.");
        } else if (!isValidImage(profilePic.buffer)) {
            errors.push("Invalid file type for profile picture.");
        }

        if (errors.length > 0) {
            return res.render('register', { error: errors.join(" ") });
        }
        // DELETE !!!! AFTER OK
        console.log(user.password);

        const hashedPassword = await bcrypt.hash(user.password, saltRounds);

        const sql = `INSERT INTO users (profile_picture, full_name, email, phone_number, password) VALUES (?, ?, ?, ?, ?)`;
        const values = [profilePic.buffer, user.full_name, user.email, user.phone_number, hashedPassword];

        req.db.query(sql, values, (err) => {
            if (err) {
                console.error(err);
                return res.render('register', { error: "Error registering user. Please try again." });
            }
            res.redirect('/login');
        });
    } catch (error) {
        console.error(error);
        res.render('register', { error: "Server error. Please try again later." });
    }
});


router.post('/login', limiter, async (req, res) => {
    try {
        const { email, password } = req.body;

        req.db.query("SELECT * FROM users WHERE email = ?", [email], async (err, results) => {
            if (err) return res.status(500).send("Database error.");
            if (results.length === 0) return res.status(401).send("Invalid credentials.");

            const user = results[0];

            const isMatch = await bcrypt.compare(password, user.password);
            if (!isMatch) return res.status(401).send("Invalid credentials.");

            req.session.user = { id: user.user_id, name: user.full_name, email: user.email };
            res.redirect('/dashboard');
        });
    } catch (error) {
        res.status(500).send("Server error");
    }
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