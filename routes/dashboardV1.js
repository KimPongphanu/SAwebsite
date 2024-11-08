let express = require('express');
let router = express.Router();
let dbCon = require('../lib/db');
const authMiddleware = require('../authMiddleware');


router.get('/', authMiddleware, (req, res) => {
    // ตรวจสอบ rank
    if (req.session.user.rank === 1) {
        return res.render('dashboard', { user: req.session.user }); // แสดง Dashboard ถ้า rank = 1
    } else {
        return res.redirect(req.headers.referer || '/'); // กลับไปหน้าที่เคยเข้าหรือหน้าแรกถ้าไม่มี
    }
});

router.get('/test',(req,res)=>{
    res.render('dashboard/test');
})

// router.get('/',(req,res)=>{
//     res.render('dashboard');
// });




// Route for logging out
router.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error('Session destruction error:', err);
            return res.status(500).send('Server error');
        }
        res.clearCookie('connect.sid');
        res.redirect('/');
    });
});

// Route for fetching room data (API)
router.get('/api', function (req, res, next) {
    dbCon.query('SELECT * from room order by ID asc', (err, rows) => {
        if (err) {
            console.log('Queue Error : ', err);
            req.flash('error', err);
            res.status(500).send('Database query error');
        } else {
           // console.log('Data from database', rows);
            res.json({ rooms: rows });
        }
    });
});

function formatDate(date) {
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();
  
    const day = date.getDate();
    const month = date.getMonth() + 1;
    const year = date.getFullYear();
  
    return `${hours}:${minutes}:${seconds}-${day}:${month}:${year}`;
  }

// Route for updating room status

router.put('/:id',authMiddleware, (req, res, next) => {
    let id = req.params.id;
    let status = req.body.status;

    if (status === undefined || (status !== 0 && status !== 1)) {
        console.error('Invalid status value provided:', status);
        return res.status(400).json({ error: 'Invalid status value' });
    }
    let date = new Date();
    let currentTime = formatDate(date);

    let form_data = { STATUS: status };

    dbCon.query('UPDATE room SET ? WHERE ROOMNO = ?', [form_data, id], (err, result) => {
        if (err) {
            console.error('Error updating room status:', err.message);
            return res.status(500).json({ error: err.message });
        }
        //console.log(`Room ${id} status updated to ${status}`);

        // Insert log for status update
        dbCon.query('INSERT INTO log (id, function, datetime) VALUES (?, "UpdateStatusRoom-Successful", ?)', [id,currentTime], (err, logResult) => {
            if (err) {
                console.error('Error inserting log entry:', err.message);
                return res.status(500).json({ error: err.message });
            }
            //console.table(`Log entry added for room ${id} with status update`);
            res.json({ success: true, message: 'Room status and log entry successfully updated' });
        });
    });
});

// Route for running custom SQL (e.g., deleting log data)
router.post('/run-sql',authMiddleware, (req, res) => {
    const sql = 'DELETE FROM log';

    dbCon.query(sql, (err, result) => {
        if (err) throw err;
        res.send('Data deleted successfully');
    });
});

// Route for fetching room details
router.get('/dataroom/:id',authMiddleware, (req, res) => {
    let roomno = req.params.id;
    dbCon.query('SELECT * FROM room WHERE roomno = ?', [roomno], (err, data, fields) => {
        if (err) {
            req.flash('error', 'An error occurred while fetching the room details.');
            return res.redirect('/dashboard');
        }
        if (data.length <= 0) {
            req.flash('error', 'Room not found with id = ' + roomno);
            return res.redirect('/dashboard');
        } else {
            res.render('dashboard/dataroom', {
                title: 'Room Details',
                room: data[0],
                imagePath: data[0].imagePath // Adjust this based on your DB schema
            });
        }
    });
});

// Route for image upload
router.post('/upload', (req, res) => {
    const upload = multer({ storage: storage }).single('file');

    upload(req, res, (err) => {
        if (err) {
            res.render('upload', { msg: err });
        } else {
            if (req.file == undefined) {
                res.render('upload', { msg: 'No file selected!' });
            } else {
                const roomno = req.body.roomno;
                const imagePath = '/uploads/' + req.file.filename; // Store the relative path to the image

                // Save the image path to the database
                dbCon.query('INSERT INTO images (roomno, image_path) VALUES (?, ?)', [roomno, imagePath], (err, result) => {
                    if (err) {
                        console.error('Error inserting image path:', err);
                        res.redirect('/error');
                    } else {
                        res.send('Image uploaded and path saved successfully');
                    }
                });
            }
        }
    });
});

// Route for fetching log data
router.get('/apilog', function (req, res, next) {
    dbCon.query('SELECT * FROM log ORDER BY count ASC', (err, data) => {
        if (err) {
            console.log('Queue Error :', err);
            req.flash('error', err);
            res.status(500).send('Database query log error');
        } else {
            //console.log('Data Log from database', data);
            res.json({ item: data });
        }
    });
});

router.get('/apiusers',(req,res,next)=>{
    dbCon.query('SELECT * FROM user_info ORDER BY user_id ASC',(err,data)=>{
        if(err){
            console.log("Query Error",err);
            req.flash("error",err);
            res.send(500).send('Database query users error');
        }else{
            res.json({item : data});
        }
    })
})

module.exports = router;
