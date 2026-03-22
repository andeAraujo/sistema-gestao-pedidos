const express = require('express');
const router = express.Router();
const { authenticateUser } = require('../middleware/auth');
const {
    listarProdutos,
    buscarProduto,
    criarProduto,
    atualizarProduto,
    removerProduto
} = require('../controllers/produto');

// Rotas públicas - não requerem autenticação
router.get('/', listarProdutos);
router.get('/:id', buscarProduto);

// Rotas protegidas - exigem token válido no header Authorization
router.post('/', authenticateUser, criarProduto);
router.put('/:id', authenticateUser, atualizarProduto);
router.delete('/:id', authenticateUser, removerProduto);

module.exports = router;
