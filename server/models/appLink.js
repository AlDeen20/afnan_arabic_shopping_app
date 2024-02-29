import { DataTypes } from 'sequelize';
import sequelize from '../config/db.js';
const applink = sequelize.define('applink', {
    link: {
    type: DataTypes.STRING,
    allowNull: false,
    },
    system: {
        type: DataTypes.STRING,
        allowNull: false,
    },
});


(async () => {
  await sequelize.sync();

  // Check if there are already any rows in the table
  const existingRows = await applink.count();
  if (existingRows === 0) {
    // Insert an initial row in the table
    await applink.create({
      link: 'www.com',
      system: 'android',
    });
    await applink.create({
      link: 'www.com',
      system: 'ios',
    });
  } 
  
})();



export default applink
