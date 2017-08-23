'use strict';
module.exports = (sequelize, DataTypes) => {
  const Product = sequelize.define('product', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    productName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    price: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false
    },
    colour: {
      type: DataTypes.STRING,
      allowNull: false
    },
    dateCreated: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    availabilityStatus: {
      type: DataTypes.ENUM,
      values: ['In Stock', 'Out of Stock', 'Archived'],
      allowNull: false
    }
  });

  Product.associate = (models) => {
    Product.belongsTo(models.brand, {foreignKey: 'brandId', onDelete: 'CASCADE'});
    Product.hasMany(models.review, {as: 'review', foreignKey: 'productId', onDelete: 'CASCADE'});
  };

  return Product;
};