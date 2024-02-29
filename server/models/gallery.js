import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const gallery = sequelize.define('gallery', {
    imageUrl: {
      type: DataTypes.STRING,
      allowNull: false,
    },
});

( () => {
  sequelize.sync();
})();

export default gallery;