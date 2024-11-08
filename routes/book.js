let express = require('express');
let router = express.Router();
let dbCon = require('../lib/db');
const authMiddleware = require('../authMiddleware');

// Route for book page
router.get('/', authMiddleware, (req, res) => {
    res.render('Book');
});

router.get('/apiBook', function (req, res, next) {
    dbCon.query('SELECT * FROM bookings ORDER BY id ASC', (err, data) => {
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


// Route for fetching room details by ID
router.get('/:id', authMiddleware, (req, res) => {
    const roomno = req.params.id;

    dbCon.query('SELECT * FROM room WHERE roomno = ?', [roomno], (err, data, fields) => {
        if (err) {
            req.flash('error', 'An error occurred. Please try again later.');
            return res.redirect('/available');
        }
        if (data.length <= 0) {
            req.flash('error', 'Room not found.');
            return res.redirect('/available');
        } else {
            res.render('Book', {
                title: 'Room Details',
                room: data[0],
                roomno: roomno,
                imagePath: data[0].imagePath // Adjust this based on your DB schema
            });
        }
    });
});

router.post('/:id', (req, res) => {
    const { date, time } = req.body;  // รับค่า date และ time จาก client
    let currentUserId = req.session.user.id;
    let roomno = req.params.id;

    // รับเวลาปัจจุบันใน UTC
    const currentTimeUTC = new Date();

    // ปรับเวลาให้เป็นเขตเวลาไทย (UTC +7)
    const currentTimeThailand = new Date(currentTimeUTC.getTime() + (7 * 60 * 60 * 1000));

    // แปลงเวลาที่ปรับให้เป็นรูปแบบ 'YYYY-MM-DD HH:mm:ss'
    const currentTimeFormatted = currentTimeThailand.toISOString().slice(0, 19).replace('T', ' ');

    // เช็คว่าห้องที่ระบุถูกต้องหรือไม่
    console.log('Room Number:', roomno);

    // เช็คประเภทห้อง
    const roomTypeQuery = 'SELECT type FROM room WHERE roomno = ?';
    dbCon.query(roomTypeQuery, [roomno], (err, roomTypeResult) => {
        if (err) {
            console.log('Error fetching room type:', err);
            return res.status(500).json({ message: 'เกิดข้อผิดพลาดในการดึงประเภทห้อง' });
        }

        console.log('Room Type Query Result:', roomTypeResult);

        if (roomTypeResult.length === 0) {
            console.log('ไม่พบห้อง');
            return res.status(404).json({ message: 'ไม่พบห้อง' });
        }

        const currentRoomType = roomTypeResult[0].type;

        // เช็คการจองห้องประเภทนี้โดยผู้ใช้
        const checkUserBookingQuery = `
            SELECT * FROM bookings 
            WHERE user_id = ? AND room_type = ?
        `;
        dbCon.query(checkUserBookingQuery, [currentUserId, currentRoomType], (err, bookingResults) => {
            if (err) {
                console.log('Error checking existing bookings:', err);
                return res.status(500).json({ message: 'เกิดข้อผิดพลาดในการตรวจสอบการจองที่มีอยู่' });
            }

            if (bookingResults.length > 0) {
                return res.status(409).json({ message: 'คุณได้จองห้องประเภทนี้ไปแล้ว' });
            }

            // เช็คว่าผู้ใช้มีการจองในวันและเวลาเดียวกันหรือไม่
            const checkUserSameTimeBookingQuery = `
                SELECT * FROM bookings 
                WHERE user_id = ? AND date = ? AND time = ?
            `;
            dbCon.query(checkUserSameTimeBookingQuery, [currentUserId, date, time], (err, sameTimeResults) => {
                if (err) {
                    console.log('Error checking existing bookings:', err);
                    return res.status(500).json({ message: 'เกิดข้อผิดพลาดในการตรวจสอบการจองที่มีอยู่' });
                }

                if (sameTimeResults.length > 0) {
                    return res.status(409).json({ message: 'คุณไม่สามารถจองห้องอีกห้องในวันและเวลานี้ได้' });
                }

                // เช็คว่ามีการจองในวันและเวลาเดียวกันสำหรับห้องนี้หรือไม่
                const checkQuery = 'SELECT * FROM bookings WHERE date = ? AND time = ? AND room_no = ?';
                dbCon.query(checkQuery, [date, time, roomno], (err, results) => {
                    if (err) {
                        console.log('Error checking booking slot:', err);
                        return res.status(500).json({ message: 'เกิดข้อผิดพลาดในการตรวจสอบช่วงเวลาการจอง' });
                    }

                    if (results.length > 0) {
                        return res.status(409).json({ message: 'ห้องนี้ถูกจองไปแล้วในช่วงเวลานี้' });
                    }

                    // บันทึกการจองรวมถึงเวลาปัจจุบัน
                    const insertQuery = 'INSERT INTO bookings (date, time, room_no, user_id, room_type, created_at) VALUES (?, ?, ?, ?, ?, ?)';
                    dbCon.query(insertQuery, [date, time, roomno, currentUserId, currentRoomType, currentTimeFormatted], (err, result) => {
                        if (err) {
                            console.log('Error inserting booking:', err);
                            return res.status(500).json({ message: 'ไม่สามารถทำการจองได้ กรุณาลองใหม่' });
                        }

                        res.status(200).json({ success: true, message: 'การจองสำเร็จ!' });
                        
                    });
                });
            });
        });
    });
});





module.exports = router;