import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const users = sequelize.define('users', {
    name: {
    type: DataTypes.STRING,
    allowNull: false,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
    },
      password: {
        type: DataTypes.STRING,
        allowNull: false,
    },
  

});

( () => {
  sequelize.sync();
})();

export default users;