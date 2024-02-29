import adminModel from '../models/admins.js';

async function accessAdmin(authusername) {
    const check_access = await adminModel.findOne({ where: { username: authusername} });
    return check_access;
}

export default accessAdmin;