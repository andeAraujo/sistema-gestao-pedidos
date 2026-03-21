require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { createClient } = require('@supabase/supabase-js');

// ------------------------------------------------------------
// Validação das variáveis de ambiente obrigatórias
// ------------------------------------------------------------
const { SUPABASE_URL, SUPABASE_SECRET_KEY, PORT = 3000 } = process.env;

if (!SUPABASE_URL || !SUPABASE_SECRET_KEY) {
  console.error('Erro: SUPABASE_URL e SUPABASE_SECRET_KEY são obrigatórios.');
  console.error('Copie o .env.example para .env e preencha com suas credenciais.');
  process.exit(1);
}

// ------------------------------------------------------------
// Cliente Supabase — SUPABASE_SECRET_KEY ignora o RLS
// ------------------------------------------------------------
const supabase = createClient(SUPABASE_URL, SUPABASE_SECRET_KEY);

// ------------------------------------------------------------
// Configuração do servidor Express
// ------------------------------------------------------------
const app = express();

app.use(cors());
app.use(express.json());

// ------------------------------------------------------------
// Health check — GET /
// Usado pelo pipeline de CI para verificar inicialização
// ------------------------------------------------------------
app.get('/', (req, res) => {
  res.json({
    status: 'ok',
    projeto: 'Sistema de Gestão de Pedidos',

    versao: '1.0.0',
  });
});

// ------------------------------------------------------------
// Rotas (serão adicionadas nos próximos cards)
// ------------------------------------------------------------
// const produtosRoutes = require('./routes/produtos');
// const pedidosRoutes = require('./routes/pedidos');
// app.use('/produtos', produtosRoutes);
// app.use('/pedidos', pedidosRoutes);

// ------------------------------------------------------------
// Inicialização
// ------------------------------------------------------------
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});

module.exports = { app, supabase };