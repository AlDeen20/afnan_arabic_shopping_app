import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const deliveryPrice = sequelize.define('deliveryPrice', {
    city_name: {
    type: DataTypes.STRING,
    allowNull: false,
    },
    delivery_price: {
      type: DataTypes.STRING,
      allowNull: false,
    },
});

( () => {
  sequelize.sync();
})();


export default deliveryPrice;