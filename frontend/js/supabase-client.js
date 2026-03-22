// ============================================================
//  Cliente Supabase (frontend)
//  Importar este arquivo antes de qualquer outro script JS
//  que precise do cliente supabase.
//
//  SUPABASE_PUBLISHABLE_KEY é segura para uso no frontend —
//  o acesso ao banco é bloqueado pelo RLS para a chave pública.
//  Toda operação sensível passa pelo backend via SUPABASE_SECRET_KEY.
// ============================================================

const SUPABASE_URL         = 'COLOQUE_SUA_URL_DO_SUPABASE_AQUI';
const SUPABASE_PUBLISHABLE = 'COLOQUE_SUA_CHAVE_PÚBLICA_AQUI';

// Criar cliente Supabase para uso no frontend
var supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE);
