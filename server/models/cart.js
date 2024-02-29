const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const cart = sequelize.define('cart', {
  amount: {
    type: DataTypes.STRING,
    allowNull: false,
    },
});

(async () => {
  await sequelize.sync();
  console.log('cart model synchronized');
})();

module.exports = cart;