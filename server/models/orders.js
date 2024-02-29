import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const orders = sequelize.define('orders', {
    
    delivery_price: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    totalProducts_price: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    order_price: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    user_phone: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    user_city: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    user_address: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    order_status: {
        type: DataTypes.STRING,
        allowNull: false,
        // default: '0',
    },
});


( () => {
    sequelize.sync();
 })(); 

export default orders;