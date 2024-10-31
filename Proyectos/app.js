const express = require('express');
const cors = require('cors'); // Importar cors
const bcrypt = require('bcrypt');
const { Pool } = require('pg');
const fetch = require('node-fetch'); // Asegúrate de tener esta dependencia instalada
const cors_proxy = require('cors-anywhere'); // Importar cors-anywhere para el proxy

const app = express();

// Habilitar CORS para todas las solicitudes
app.use(cors({
  origin: '*' // Permitir cualquier origen
}));

app.use(express.json());

// Configuración de la conexión a la base de datos
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'GenshinImpact',
  password: 'sam1609',
  port: 5432,
});

// Ruta para el login
app.post('/login', async (req, res) => {
  const { uid, contrasena } = req.body;

  try {
    const query = 'SELECT * FROM usuarios WHERE usuario = $1';
    const result = await pool.query(query, [uid]);

    if (result.rows.length === 0) {
      return res.status(400).json({ error: 'Usuario no encontrado' });
    }

    const user = result.rows[0];

    // Comparar la contraseña en texto plano
    if (contrasena !== user.contrasena) {
      return res.status(400).json({ error: 'Contraseña incorrecta' });
    }

    res.status(200).json({ message: `Bienvenido ${user.uid}`, rol: user.rol });
  } catch (err) {
    console.error('Error detallado:', err);
    res.status(500).json({ error: 'Error de servidor' });
  }
});

// Ruta para solicitar datos desde la API de Enka con el proxy
app.get('/api/uid/:uid', async (req, res) => {
  const { uid } = req.params;
  const apiUrl = `http://localhost:8080/https://enka.network/api/uid/${uid}?info/AvatarInfoList`;

  try {
    const response = await fetch(apiUrl, {
      headers: {
        'origin': 'http://localhost:3000', // Agregar encabezados esperados
        'x-requested-with': 'XMLHttpRequest'
      }
    });

    if (!response.ok) {
      const errorText = await response.text(); // Obtén el texto del error
      console.error(`Error al obtener datos desde Enka: ${response.status} - ${errorText}`);
      return res.status(response.status).json({ 
        error: `Error al obtener datos desde Enka: ${response.status} - ${errorText}` 
      });
    }

    const data = await response.json();
    res.status(200).json(data);
  } catch (error) {
    console.error('Error en la solicitud a Enka:', error);
    res.status(500).json({ error: 'Error de servidor al consultar Enka API' });
  }
});


// Ruta para obtener los ataques básicos de un personaje
app.get('/basicos/:id_personaje/:id_ataque', async (req, res) => {
  const idPersonaje = req.params.id_personaje;
  const idAtaque = req.params.id_ataque; // Obtener el id del ataque
  const attackLevel = req.query.level; // Obtener el nivel del ataque desde los parámetros de la consulta

  try {
    let query = `
      SELECT attack_name, formula, multiplier, nivel
      FROM basicos
      WHERE id_personaje = $1 AND id_basico = $2
    `;
    
    const queryParams = [idPersonaje, idAtaque];

    if (attackLevel) {
      query += ' AND nivel = $3';
      queryParams.push(attackLevel);
    }

    const result = await pool.query(query, queryParams);
    res.json(result.rows);
  } catch (error) {
    console.error("Error al obtener datos de los ataques básicos:", error);
    res.status(500).send('Error al obtener datos de los ataques básicos');
  }
});
app.get('/elemental/:id_personaje/:id_ataque', async (req, res) => {
  const idPersonaje = req.params.id_personaje;
  const idAtaque = req.params.id_ataque; // Obtener el id del ataque elemental
  const attackLevel = req.query.level; // Obtener el nivel del ataque desde los parámetros de la consulta

  try {
    let query = `
      SELECT attack_name, formula, multiplier, nivel
      FROM elemental
      WHERE id_personaje = $1 AND id_elemental = $2
    `;
    
    const queryParams = [idPersonaje, idAtaque];

    if (attackLevel) {
      query += ' AND nivel = $3';
      queryParams.push(attackLevel);
    }

    const result = await pool.query(query, queryParams);
    res.json(result.rows);
  } catch (error) {
    console.error("Error al obtener datos de los ataques elementales:", error);
    res.status(500).send('Error al obtener datos de los ataques elementales');
  }
});




// Iniciar el proxy cors-anywhere
cors_proxy.createServer({
  originWhitelist: [], // Deja la lista vacía para permitir todas las solicitudes
  requireHeader: ['origin', 'x-requested-with'],
  removeHeaders: ['cookie', 'cookie2'],
  setHeaders: { // Añadir los encabezados esperados
    'origin': 'http://localhost:3000', // o cualquier valor válido
    'x-requested-with': 'XMLHttpRequest'
  }
}).listen(8080, 'localhost', () => {
  console.log('CORS Anywhere está corriendo en localhost:8080');
});

// Inicializar el servidor en el puerto 3000
app.listen(3000, () => {
  console.log('Servidor corriendo en el puerto 3000');
});
