'use strict';
module.exports = (sequelize, DataTypes) => {
  const Review = sequelize.define('review', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    comment: {
      type: DataTypes.STRING,
      allowNull: false
    },
    rating: {
      type: DataTypes.INTEGER,
      validate: { min: 0, max: 10 },
      allowNull: false
    }
  });

  Review.associate = (models) => {
    Review.belongsTo(models.user, {as: 'user', foreignKey: 'userId', onDelete: 'CASCADE'});
    Review.belongsTo(models.product, {as: 'product', foreignKey: 'productId', onDelete: 'CASCADE',});
  };
  return Review;
};