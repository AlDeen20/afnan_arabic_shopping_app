import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const admins = sequelize.define('admins', {
    name: {
    type: DataTypes.STRING,
    allowNull: false,
    },
    username: {
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

export default admins;