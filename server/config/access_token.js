import jwtSecret from '../config/config.js';
import jsonwebtoken from 'jsonwebtoken';

function accessToken(req, res, next) {
const token = req.headers['authorization'];
    if (!token) {
      console.log('تحتاج إلى تسجيل الدخول للوصول إلى هذه الصفحة');
      return res.status(401).json('تحتاج إلى تسجيل الدخول للوصول إلى هذه الصفحة');
    }
  
    jsonwebtoken.verify(token, jwtSecret, (err, decoded) => {
      if (err) {
        console.log('الوصول غير مسموح');
        return res.status(403).json('الوصول غير مسموح');
      }
  
      req.userId = decoded.userId;
      next();
    });
}

export default accessToken