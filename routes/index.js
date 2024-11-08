var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
  const user = req.session.user || null;
  res.render('index', { user: user });
});


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

module.exports = router;
