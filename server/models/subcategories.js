import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';

const subcategories = sequelize.define('subcategories', {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
    },
});

( () => {
  sequelize.sync();
})();

export default subcategories;
