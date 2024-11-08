const express = require('express');
const bcrypt = require('bcrypt');
const router = express.Router();
const dbCon = require('../lib/db');
const saltRounds = 10;

router.get('/', (req, res) => {
    const error = req.session.error || null; // รับค่าจาก session
    req.session.error = null; // ล้างค่าหลังจากใช้
    res.render('auth', { error, action: 'login' });
});

router.post('/', async (req, res) => {
    console.log(req.body);
    const action = req.body.action; // use a hidden input in the form to distinguish

    if (action === 'register') {
        const { firstname, lastname, phone, email, password } = req.body;
        if (!firstname || !lastname || !phone || !email || !password) {
            return res.render('auth', { error: 'All fields are required', action: 'register' });
        }

        try {
            const isEmailTaken = await checkIfEmailExists(email);
            if (isEmailTaken) {
                return res.render('auth', { error: 'Username already exists', action: 'register' });
            }

            const hashedPassword = await bcrypt.hash(password, saltRounds);
            await createUser(email, hashedPassword);

            const searchID = "SELECT id FROM users WHERE email = ?";
            dbCon.query(searchID, [email], async (err, result) => {
                if (err) {
                    console.error("Database query error", err);
                    return;
                }
                if (result.length > 0) {
                    let user_id = result[0].id;
                    let select = "register";
                    await postReport(user_id, res, select, "register");
                    const insertQuery = "INSERT INTO user_info (user_id, first_name, last_name, email, phone) VALUES (?, ?, ?, ?, ?)";
                    dbCon.query(insertQuery, [user_id, firstname, lastname, email, phone], (err, result) => {
                        if (err) {
                            console.error("Database query error", err);
                            return;
                        } else {
                            return res.render('auth', { success: 'User registered successfully', action: 'register' });
                        }
                    });
                }else{
                    return res.render('auth', { error: 'User ID not found', action: 'register' });
                }
            });


        } catch (error) {
            console.error('Error during registration:', error.message);
            res.render('auth', { error: 'Error occurred during registration: ' + error.message, action: 'register' });
        }
    } else if (action === 'login') {
        const { email, password } = req.body;
        dbCon.query('SELECT * FROM users WHERE email = ?', [email], async (err, result) => {
            if (err) {
                console.error('Database query error:', err);
                return res.status(500).send('Server error');
            }

            if (result.length > 0) {
                const user = result[0];
                const match = await bcrypt.compare(password, user.password);

                if (match) {
                    req.session.user = {
                        id: user.id,
                        tel: user.phone,
                        // username: user.username,
                        // name: user.name,
                        rank: user.rank,
                    };
                    let select = "login";
                    await postReport(user.id, res, select, "login");
                    // ตรวจสอบและกำหนดค่า redirectUrl ให้ถูกต้อง
                    const redirectUrl = req.session.returnTo || (user.rank === 1 ? '/dashboard' : '/');
                    delete req.session.returnTo; // ลบค่า URL ที่เก็บไว้หลังจากเปลี่ยนเส้นทาง
                    res.redirect(redirectUrl); // ใช้งานตัวแปร redirectUrl
                } else {
                    res.render('auth', { error: 'Username or password is incorrect', action: 'login' });
                }
            } else {
                res.render('auth', { error: 'Username or password is incorrect', action: 'login' });
            }
        });
    } else {
        res.status(400).render('auth', { error: 'Invalid action', action: 'login' });
    }
});


async function checkIfEmailExists(email) {
    const checkUserQuery = 'SELECT * FROM users WHERE email = ?';

    return new Promise((resolve, reject) => {
        dbCon.query(checkUserQuery, [email], (err, userCheckResult) => {
            if (err) {
                return reject(err); // ถ้ามีข้อผิดพลาด ให้ reject
            }
            resolve(Array.isArray(userCheckResult) && userCheckResult.length > 0);
        });
    });
}

async function createUser(email, hashedPassword) {
    const userQuery = 'INSERT INTO users (email, password) VALUES (?, ?)';
    await dbCon.query(userQuery, [email, hashedPassword]);
}

async function postReport(id, res, select, type) {
    const currentTime = formatDate(new Date());
    console.log(currentTime);
    let event;

    if (select === "login") {
        event = "Login-Successful";
    } else if (select === "register") {
        event = "Register-Successful";
    } else {

        return res.render('auth', { error: `portReport${select === "login" ? "Login" : "Register"} failed`, action: select });
    }

    dbCon.query('INSERT INTO report (user_id, function, datetime, type) VALUES (?,?,?,?)', [id, event, currentTime, type], (err) => {
        if (err) {
            console.error('Error inserting log entry:', err.message);
            return res.render('auth', { error: `portReport${select === "login" ? "Login" : "Register"} failed`, action: select });
        }
    });
}


function formatDate(date) {
    const hours = date.getHours().toString().padStart(2, '0');
    const minutes = date.getMinutes().toString().padStart(2, '0');
    const seconds = date.getSeconds().toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const year = date.getFullYear();

    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}

module.exports = router;
