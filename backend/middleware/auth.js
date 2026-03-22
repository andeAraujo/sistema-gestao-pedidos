const { supabase } = require('../server');

/**
 * Middleware de autenticação — valida o token JWT do Supabase.
 *
 * Uso: adicionar como segundo argumento em qualquer rota protegida.
 * Exemplo: router.post('/produtos', authenticateUser, criarProduto);
 *
 * O token deve ser enviado no header:
 * Authorization: Bearer <token>
 *
 * O token é gerado automaticamente pelo SDK do Supabase no frontend
 * após supabase.auth.signInWithPassword() — não é gerado manualmente.
 */
async function authenticateUser(req, res, next) {
  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({ erro: 'Token de autenticação não fornecido.' });
  }

  const token = authHeader.split(' ')[1];

  const { data, error } = await supabase.auth.getUser(token);

  if (error || !data.user) {
    return res.status(401).json({ erro: 'Token inválido ou expirado.' });
  }

  // Disponibiliza os dados do usuário autenticado para a rota
  req.user = data.user;

  next();
}

module.exports = { authenticateUser };