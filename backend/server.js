const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

// Conexão com o MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: ''
});

db.connect(err => {
  if (err) {
    console.error('Erro ao conectar ao MySQL:', err);
    return;
  }
  console.log('Conectado ao MySQL com sucesso!');
});

app.get('/', (req, res) => {
  res.send('API do Driveline está funcionando!');
});

app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));
