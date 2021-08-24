const express = require('express');
const mongoose = require('mongoose');
const routes = require('./routers');

require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 8000;

// parse application/json
app.use(express.json());

const uri = process.env.MONGODB_URI;

mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true });

let db = mongoose.connection;

// Connecting to the Mongo Database.
db.on('error', console.error.bind(console, 'MongoDB connection error'));
db.once('open', function () {
  // we're connected!
  console.log('database connected');
});

//Get Routes
app.use(routes);

app.listen(PORT, () => {
  console.log(`Server start at PORT ${PORT}`);
});