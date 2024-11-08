function authMiddleware(req, res, next) {
    if (req.session.user) {
        return next(); 
    } else {     
        req.session.returnTo = req.originalUrl;
        res.redirect('/login'); 
    }
}

module.exports = authMiddleware;

