var express = require('express');
var router = express.Router();

var dbcon = require('../lib/db');

router.get('/', function(req, res, next) {
    res.render('status');
});

router.get('/api',function(req,res,next){
    dbcon.query('SELECT ROOMNO, STATUS from room order by ID asc',(err,rows) =>{
        if(err){
            console.log('Queue Error : ',err);
            req.flash('error',err);
            res.status(500).send('Database query error');
        }else{
            console.log('Data from database',rows);
            res.json({rooms: rows });
            
        }
    });
});

router.get('/booking',function(req,res,next){
    res.render('status/booking');
});

module.exports = router;

