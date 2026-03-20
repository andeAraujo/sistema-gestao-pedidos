-- ============================================================
--  Sistema de Gestão de Pedidos — Schema do Banco de Dados
--  Executar script no SQL Editor do Supabase
-- ============================================================

-- ------------------------------------------------------------
-- 1. PRODUTOS
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS produtos (
    id         SERIAL         PRIMARY KEY,
    nome       VARCHAR(150)   NOT NULL,
    preco      NUMERIC(10, 2) NOT NULL CHECK (preco >= 0),
    descricao  TEXT,
    imagem_url TEXT,
    ativo      BOOLEAN        NOT NULL DEFAULT TRUE,
    criado_em  TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- 2. PEDIDOS
--    usuario_id referencia auth.users(id) do Supabase Auth.
--    Tipo UUID — NÃO usar SERIAL/INTEGER aqui.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pedidos (
    id           SERIAL         PRIMARY KEY,
    usuario_id   UUID           REFERENCES auth.users(id),
    cliente_nome VARCHAR(150)   NOT NULL,
    telefone     VARCHAR(20)    NOT NULL,
    endereco     TEXT           NOT NULL,
    data_entrega DATE           NOT NULL,
    valor_total  NUMERIC(10, 2) NOT NULL DEFAULT 0 CHECK (valor_total >= 0),
    status       VARCHAR(20)    NOT NULL DEFAULT 'pendente'
                                CHECK (status IN ('pendente', 'confirmado', 'entregue')),
    data_pedido  TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- 3. ITENS DO PEDIDO
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS itens_pedido (
    id             SERIAL         PRIMARY KEY,
    pedido_id      INTEGER        NOT NULL REFERENCES pedidos(id)  ON DELETE CASCADE,
    produto_id     INTEGER        NOT NULL REFERENCES produtos(id) ON DELETE RESTRICT,
    quantidade     INTEGER        NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10, 2) NOT NULL CHECK (preco_unitario >= 0),
    subtotal       NUMERIC(10, 2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED
);

-- ------------------------------------------------------------
-- ÍNDICES
-- ------------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_pedidos_usuario_id   ON pedidos(usuario_id);
CREATE INDEX IF NOT EXISTS idx_pedidos_status       ON pedidos(status);
CREATE INDEX IF NOT EXISTS idx_pedidos_data_entrega ON pedidos(data_entrega);
CREATE INDEX IF NOT EXISTS idx_pedidos_data_pedido  ON pedidos(data_pedido);
CREATE INDEX IF NOT EXISTS idx_itens_pedido_id      ON itens_pedido(pedido_id);
CREATE INDEX IF NOT EXISTS idx_itens_produto_id     ON itens_pedido(produto_id);

-- ------------------------------------------------------------
-- ROW LEVEL SECURITY (RLS)
--    Bloqueia acesso direto pela anon key (chave pública).
--    O backend Node.js acessa via SERVICE_ROLE_KEY (ignora RLS).
--    Não é necessário criar policies para `authenticated` pois
--    nenhuma requisição chega ao banco sem passar pela API.
-- ------------------------------------------------------------
ALTER TABLE produtos     ENABLE ROW LEVEL SECURITY;
ALTER TABLE pedidos      ENABLE ROW LEVEL SECURITY;
ALTER TABLE itens_pedido ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Sem acesso anonimo - produtos"
    ON produtos FOR ALL TO anon USING (false);

CREATE POLICY "Sem acesso anonimo - pedidos"
    ON pedidos FOR ALL TO anon USING (false);

CREATE POLICY "Sem acesso anonimo - itens_pedido"
    ON itens_pedido FOR ALL TO anon USING (false);

-- ------------------------------------------------------------
-- USUÁRIO INICIAL
--    NÃO usar INSERT SQL para criar a vendedora.
--    Criar pelo painel do Supabase: Authentication → Users → Add user
--    Ou via API no backend (uma única vez, durante o setup):
--
--    const { data, error } = await supabase.auth.admin.createUser({
--      email: 'vendedora@email.com',
--      password: 'senha_segura',
--      email_confirm: true
--    })
--
--    O SERVICE_ROLE_KEY é obrigatório para usar auth.admin.
-- ------------------------------------------------------------