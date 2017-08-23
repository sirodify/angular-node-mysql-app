'use strict';
module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('user', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    userType: {
      type: DataTypes.ENUM,
      values: ['Customer', 'Merchant'],
      allowNull: false
    },
    userName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      unique: true,
      validate: {
        isEmail: true
      },
      allowNull: false
    },
    dateOfBirth: DataTypes.DATEONLY
  });

  User.associate = (models) => {
    User.hasMany(models.review, {as: 'review', foreignKey: 'userId', onDelete: 'CASCADE'});
  };
  return User;
};