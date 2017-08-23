'use strict';
module.exports = (sequelize, DataTypes) => {
  const Brand = sequelize.define('brand', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true
    }
  });

  Brand.associate = (models) => {
    Brand.hasMany(models.product, {as: 'product', foreignKey: 'brandId', onDelete: 'CASCADE'});
  };

  return Brand;
};