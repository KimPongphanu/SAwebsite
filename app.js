var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const multer = require('multer');
let flash = require('express-flash');
let session = require('express-session');
let mysql = require('mysql');
let connection = require('./lib/db');

var profileRouter = require('./routes/profile')
var uploadRouter = require('./routes/upload');
var indexRouter = require('./routes/index');
var authRouter = require('./routes/auth');
var availableRoomRouter = require('./routes/availableRooms');
var dashboardRouter = require('./routes/dashboard');
var bookingRouter = require('./routes/book');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
  cookie : {maxAge : 600000},
  store : new session.MemoryStore,
  saveUninitialized : 'true',
  resave : 'false',
  secret: 'secret'
}));

app.use(flash());

//USE//
app.use('/upload',uploadRouter);
app.use('/uploads', express.static('uploads'));
app.use('/Book',bookingRouter);

// LoginS
app.use('/login', authRouter);
app.use('/register', authRouter);

app.use('/profile',profileRouter);

// Admin routes
app.use('/dashboard', dashboardRouter);
app.use('/dashboard/dataroom', dashboardRouter);
app.use('/dashboard/test',dashboardRouter);

app.use('/', indexRouter);

//Available
app.use('/available',availableRoomRouter);
app.use('/available/A-type',availableRoomRouter);
app.use('/available/B-type',availableRoomRouter);
app.use('/available/C-type',availableRoomRouter);
app.use('/available/D-type',availableRoomRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  console.log(req.path);
  next(createError(404));
  
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});




module.exports = app;
