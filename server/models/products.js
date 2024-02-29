import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const products = sequelize.define('products', {
    title: {
    type: DataTypes.STRING,
    allowNull: false,
    },
    price: {
      type: DataTypes.STRING,
      allowNull: false,
      },
    des: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    imageUrl: {
      type: DataTypes.STRING,
      allowNull: true,
  },
});

( () => {
  sequelize.sync();
})();

export default products;
