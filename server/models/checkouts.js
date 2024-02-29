import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const checkouts = sequelize.define('checkouts', {

    product_id: {
    type: DataTypes.STRING,
    allowNull: false,
    },
    product_price: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    amount: {
        type: DataTypes.STRING,
        allowNull: false,
    },
});

( () => {
    sequelize.sync();
 })();

export default checkouts;