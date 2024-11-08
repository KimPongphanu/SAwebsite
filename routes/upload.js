var express = require('express');
var router = express.Router();
const multer = require('multer');
const path = require('path');
let dbCon = require('../lib/db');
const flash = require('express-flash'); // import express-flash
const session = require('express-session');

// Middleware สำหรับ session
router.use(session({
    secret: 'your_secret', // เปลี่ยนเป็นความลับที่คุณต้องการ
    resave: false,
    saveUninitialized: true
}));
router.use(flash());

router.get('/', (req, res) => {
    // Query เพื่อดึงข้อมูลรูปจากฐานข้อมูล
    dbCon.query('SELECT filename, filepath FROM images2', (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error fetching images from database');
        }

        // ส่งข้อมูล 'images' และ flash messages ไปยัง template 'test.ejs'
        res.render('upload', {
             images: results,
            successMessage: req.flash('success') // ส่ง success message
        });
    });
});




// Set storage engine
const storage = multer.diskStorage({
    destination: './uploads/', // Directory to store uploaded files
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname)); // Create unique file name
    }
});

// Init upload
const upload = multer({
    storage: storage
}).array('image', 1); // อนุญาตให้อัปโหลดสูงสุด 10 รูป

router.post('/', upload, (req, res) => {
    const roomType = req.body.roomType; // รับค่า room type จากฟอร์ม

    // ตรวจสอบว่ามีไฟล์และประเภทห้องถูกเลือก
    if (req.files && req.files.length > 0 && roomType) {
        // แสดงผลชื่อไฟล์ที่ถูกอัปโหลดทั้งหมด
        console.log(req.files);

        // บันทึกข้อมูลไฟล์แรกพร้อมกับประเภทห้องลงในฐานข้อมูล
        const newImage = {
            filename: req.files[0].filename,  // ใช้ไฟล์แรกที่ถูกอัปโหลด
            filepath: req.files[0].path,
            room_type: roomType
        };

        dbCon.query('INSERT INTO images2 SET ?', newImage, (err, result) => {
            if (err) {
                console.error(err);
                return res.status(500).send('Error saving image to database');
            }

            // แสดงข้อความสำเร็จ
            req.flash('success', 'Images uploaded successfully.');
            res.redirect('/upload');  // เปลี่ยนเส้นทางไปยังหน้า /test เพื่อทำการรีเฟรช
        });
    } else {
        req.flash('error', 'Error: No files uploaded or room type not selected.'); // แสดงข้อความ error
        res.redirect('/upload'); // รีเฟรชหน้า test
    }
});
module.exports = router;
