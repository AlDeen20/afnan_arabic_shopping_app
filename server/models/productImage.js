import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const productImage = sequelize.define('productImage', {
    imageUrl: {
        type: DataTypes.STRING,
        allowNull: false,
      },
});

( () => {
  sequelize.sync();
})();

export default productImage;
