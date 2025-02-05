require('dotenv').config();

const path = require('path');

// express
const express = require('express');

// express-session
const session = require('express-session');
const fs = require('fs');
const https = require('https');


const app = express();

const key = fs.readFileSync('./ssl_certs/key.pem');
const cert = fs.readFileSync('./ssl_certs/cert.pem');

const options = {
    key: key,
    cert: cert,
     // If you set a passphrase while creating the certificate
  };
  



// set session middleware
app.use(session({
    secret: '@manifesting4.0=key!',
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 20 * 60 * 1000 } // 20 minutes
}))

// set up JSON body parsing
app.use(express.static(__dirname));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// multer for file uploads in form
const multer = require('multer');
const storage = multer.memoryStorage();
const upload = multer({
    storage: storage,
    limits: { fileSize: 10 * 1024 * 1024 }
});
app.use(upload.single('file-upload'));


// express-hbs
const exphbs = require('express-handlebars');

// routes
const routes = require('./route/route.js');

// sql database
const user_db = require('./model/database.js');
app.use((req, _, next) => {
    req.db = user_db; // Inject the database connection into req object
    next();
});

// set PORT
const port = process.env.PORT;

// express-hbs setup
app.engine('hbs', exphbs.engine({ 
    extname: 'hbs', 
    partialsDir: '',
    layoutsDir: '',
    defaultLayout: ''
}));
app.set('view engine', 'hbs');

// static assets folder
app.use(express.static('public'));

// router
app.use('/', routes);


const server = https.createServer(options, app);

// commented this for app.js
//app.listen(port, () => {
  // log(`Listening on port ${port}`)
//});

// Start server
// Start HTTPS server
server.listen(port, () => {
    console.log(`Server is running on https://localhost:${port}`);
 });