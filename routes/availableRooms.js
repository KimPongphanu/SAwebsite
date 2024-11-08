let express = require('express');
let router = express.Router();
let dbCon = require('../lib/db');

router.get('/',function(req,res,next){
    const user = req.session.user || null;
    res.render('available', { user: user });
});

router.get('/A-type',function(req,res,next){
    const user = req.session.user || null;
    res.render('available/A-type', { user: user });
});

router.get('/B-type',function(req,res,next){
    const user = req.session.user || null;
    res.render('available/B-type', { user: user });
})

router.get('/C-type',function(req,res,next){
    const user = req.session.user || null;
    res.render('available/C-type', { user: user });
})

router.get('/D-type',function(req,res,next){
    const user = req.session.user || null;
    res.render('available/D-type', { user: user });
})

router.get('/api',function(req,res,next){
    dbCon.query('SELECT * FROM room ORDER BY ID ASC',(err,rows) =>{
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

module.exports = router;