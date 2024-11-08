let express = require('express');
let router = express.Router();
let dbCon = require('../lib/db');
const authMiddleware = require('../authMiddleware');
const cron = require('node-cron');

// ฟังก์ชันเพื่อตรวจสอบและยกเลิกการจองที่หมดอายุ
function cancelExpiredBookings() {
    const currentTime = new Date();
    
    // ลดเวลาปัจจุบัน 2 ชั่วโมง
    const timeLimit = new Date();
    timeLimit.setHours(currentTime.getHours() - 2);

    // คิวรีเพื่อเลือกการจองที่หมดอายุ
    const cancelQuery = 'DELETE FROM bookings WHERE time < ?';
    dbCon.query(cancelQuery, [timeLimit], (err, result) => {
        if (err) {
            console.log('Error canceling expired bookings:', err);
            return;
        }

        if (result.affectedRows > 0) {
            console.log(`${result.affectedRows} expired booking(s) canceled successfully.`);
        } else {
            console.log('No expired bookings to cancel.');
        }
    });
}


// ตั้งค่าการทำงานของ cron job ทุกๆ นาที
cron.schedule('* * * * *', () => {
    console.log('Checking for expired bookings...');
    cancelExpiredBookings();
});


// Route สำหรับโชว์โปรไฟล์
router.get('/', authMiddleware, (req, res) => {
    const userId = req.session.user.id;

    // ดึงข้อมูลโปรไฟล์
    const userQuery = 'SELECT * FROM user_info WHERE user_id = ?';
    dbCon.query(userQuery, [userId], (err, userData) => {
        if (err || userData.length <= 0) {
            req.flash('error', 'Error fetching user data');
            return res.redirect('/');
        }

        const userProfile = userData[0];

        // ดึงข้อมูลการจอง
        const bookingQuery = 'SELECT * FROM bookings WHERE user_id = ?';
        dbCon.query(bookingQuery, [userId], (err, bookingData) => {
            if (err) {
                req.flash('error', 'Error fetching bookings');
                return res.redirect('/');
            }

            // คำนวณเวลาที่เหลือสำหรับแต่ละการจอง
            const currentTime = new Date();
            const bookingsWithTimeLeft = bookingData.map(booking => {
                const endTime = new Date(booking.end_time); // ตรวจสอบให้แน่ใจว่า end_time ถูกต้อง
                if (isNaN(endTime.getTime())) { // ตรวจสอบว่ามันเป็นวันที่ที่ถูกต้องหรือไม่
                    console.error(`Invalid end_time for booking ID: ${booking.id}`);
                    return {
                        ...booking,
                        timeLeft: { hours: 0, minutes: 0, seconds: 0 } // หากไม่ถูกต้อง ให้ตั้งค่าเป็น 0
                    };
                }

                const timeLeft = Math.max(0, endTime - currentTime); // คำนวณเวลาที่เหลือ (ms)
                const minutesLeft = Math.floor((timeLeft / 1000 / 60) % 60);
                const hoursLeft = Math.floor((timeLeft / 1000 / 60 / 60) % 24);
                const secondsLeft = Math.floor((timeLeft / 1000) % 60);

                return {
                    ...booking,
                    timeLeft: {
                        hours: hoursLeft,
                        minutes: minutesLeft,
                        seconds: secondsLeft,
                    }
                };
            });


            // ส่งข้อมูลการจองที่มีเวลาที่เหลือไปที่หน้าโปรไฟล์
            res.render('profile', {
                title: 'User Profile',
                user: userProfile,
                bookings: bookingsWithTimeLeft // ส่งข้อมูลการจองทั้งหมดที่มีเวลาที่เหลือไป
            });
        });

    });
});

router.post('/cancel/:bookingId', authMiddleware, (req, res) => {
    const bookingId = req.params.bookingId;

    // ลบการจองจากฐานข้อมูล
    const cancelQuery = 'DELETE FROM bookings WHERE id = ? AND user_id = ?';
    dbCon.query(cancelQuery, [bookingId, req.session.user.id], (err, result) => {
        if (err) {
            console.log('Error canceling booking:', err);
            return res.status(500).json({ message: 'ไม่สามารถยกเลิกการจองได้ กรุณาลองใหม่' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'ไม่พบการจองที่ต้องการยกเลิก' });
        }

        // ส่งข้อความยืนยันการยกเลิกการจอง
        res.status(200).json({ success: true, message: 'การจองถูกยกเลิกเรียบร้อยแล้ว' });
    });
});

module.exports = router;
