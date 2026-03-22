// ============================================================
//  DoceGestor — Funções de autenticação
//  Depende de supabase-client.js carregado antes deste arquivo.
// ============================================================

// Login com e-mail e senha via Supabase Auth
async function login(email, senha) {
  const { data, error } = await supabaseClient.auth.signInWithPassword({
    email,
    password: senha,
  });
  return { data, error };
}

// Logout — encerra a sessão e redireciona para login
async function logout() {
  await supabaseClient.auth.signOut();
  window.location.href = 'login.html';
}

// Verifica sessão ativa — redireciona para login se não houver
// Chamar no topo de todas as páginas protegidas
async function exigirAutenticacao() {
  const { data } = await supabaseClient.auth.getSession();
  if (!data.session) {
    window.location.href = 'login.html';
  }
  return data.session;
}

// Retorna o token JWT da sessão atual
// Usado pelo frontend ao chamar a API do backend:
// headers: { Authorization: `Bearer ${await getToken()}` }
async function getToken() {
  const { data } = await supabaseClient.auth.getSession();
  return data.session?.access_token ?? null;
}