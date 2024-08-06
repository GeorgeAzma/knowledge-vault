Typically you don't program in [[SQL]] you use ORMs
which maps object oriented languages to relational databases
there are different ORMs for different languages
- **JavaScript** Sequelize
- **Python** Django/SQLalchemy
- **Rust** Diesel
### Sequelize JS Example
``` js
const { Sequelize, DataTypes } = require('sequelize');

// Initialize Sequelize with your database connection details
const sequelize = new Sequelize('database_name', 'username', 'password', {
  host: 'localhost',
  dialect: 'mysql', // Change this to 'postgres' if you are using PostgreSQL
});

// Define the Player model
const Player = sequelize.define('Player', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  team_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});

// Define the Team model
const Team = sequelize.define('Team', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

// Establish associations between Player and Team
Player.belongsTo(Team, { foreignKey: 'team_id', as: 'team' }); // Player belongs to Team

// Sync the models with the database (creates tables if they don't exist)
sequelize.sync()
  .then(() => {
    console.log('Database synchronized');
  })
  .catch((err) => {
    console.error('Error syncing database:', err);
  });

```
> [!tip]
> - Store database name, username, password, host in `.env` file
> - Enable [[Transport Layer Security (TLS)|TLS]]/SSL encryption for secure connections in sequelize and db server
> - 
