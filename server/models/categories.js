import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const categories = sequelize.define('categories', {
    title: {
    type: DataTypes.STRING,
    allowNull: false,
    },
    imageUrl: {
      type: DataTypes.STRING,
      allowNull: false,
    },
});

( () => {
  sequelize.sync();
})();

export default categories
