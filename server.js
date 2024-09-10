const sql = require('mssql');

const config = {
  server: 'localhost', // Cambia esto si tu servidor tiene un nombre diferente
  database: 'Genshin',
  options: {
    encrypt: true, // Si estás usando cifrado
    trustServerCertificate: true // Si estás usando certificados auto-firmados
  },
  // Usa la autenticación integrada de Windows
  authentication: {
    type: 'ntlm' // Autenticación integrada de Windows
  }
};

sql.connect(config)
  .then(pool => {
    if (pool.connected) {
      console.log('Connected to SQL Server');
    }
  })
  .catch(err => {
    console.error('Database connection failed:', err);
  });
