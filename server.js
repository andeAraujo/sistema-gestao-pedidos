//Importações
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const supabase = require('./config/supabase');

//inicialização
const app = express();

//middlewares
app.use(cors());
app.use(express.json());

//portas
const PORT = process.env.PORT || 3000;

//heath check
app.get('/', (req, res)=> {
    res.json({
        status: 'ok',
        message: 'servidor rodando meus manos',

    });
});
//iniciar servidor
app.listen(PORT, ()=> {
console.log(`servidor rodando em http://localhost:${PORT}`);
})