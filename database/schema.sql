-- ============================================================
--  Sistema de Gestão de Pedidos — Schema do Banco de Dados
--  Executar script no SQL Editor do Supabase
-- ============================================================

-- ------------------------------------------------------------
-- 1. USUÁRIOS (vendedora)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
    id         SERIAL       PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    email      VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    criado_em  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- 2. PRODUTOS
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS produtos (
    id         SERIAL       PRIMARY KEY,
    nome       VARCHAR(150) NOT NULL,
    preco      NUMERIC(10, 2) NOT NULL CHECK (preco >= 0),
    descricao  TEXT,
    imagem_url TEXT,
    ativo      BOOLEAN      NOT NULL DEFAULT TRUE,
    criado_em  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- 3. PEDIDOS
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pedidos (
    id           SERIAL       PRIMARY KEY,
    usuario_id   INTEGER      REFERENCES usuarios(id),
    cliente_nome VARCHAR(150) NOT NULL,
    telefone     VARCHAR(20)  NOT NULL,
    endereco     TEXT         NOT NULL,
    data_entrega DATE         NOT NULL,
    valor_total  NUMERIC(10, 2) NOT NULL DEFAULT 0 CHECK (valor_total >= 0),
    status       VARCHAR(20)  NOT NULL DEFAULT 'pendente'
                              CHECK (status IN ('pendente', 'confirmado', 'entregue')),
    data_pedido  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- 4. ITENS DO PEDIDO
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS itens_pedido (
    id             SERIAL  PRIMARY KEY,
    pedido_id      INTEGER NOT NULL REFERENCES pedidos(id)  ON DELETE CASCADE,
    produto_id     INTEGER NOT NULL REFERENCES produtos(id) ON DELETE RESTRICT,
    quantidade     INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10, 2) NOT NULL CHECK (preco_unitario >= 0),
    subtotal       NUMERIC(10, 2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED
);

-- ------------------------------------------------------------
-- ÍNDICES
-- ------------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_pedidos_status       ON pedidos(status);
CREATE INDEX IF NOT EXISTS idx_pedidos_data_entrega ON pedidos(data_entrega);
CREATE INDEX IF NOT EXISTS idx_pedidos_data_pedido  ON pedidos(data_pedido);
CREATE INDEX IF NOT EXISTS idx_itens_pedido_id      ON itens_pedido(pedido_id);
CREATE INDEX IF NOT EXISTS idx_itens_produto_id     ON itens_pedido(produto_id);

-- ------------------------------------------------------------
-- ROW LEVEL SECURITY (RLS)
--    Bloqueia acesso pela anon key (chave pública).
--    O backend Node.js acessa via SERVICE_ROLE_KEY (ignora RLS).
-- ------------------------------------------------------------
ALTER TABLE usuarios     ENABLE ROW LEVEL SECURITY;
ALTER TABLE produtos     ENABLE ROW LEVEL SECURITY;
ALTER TABLE pedidos      ENABLE ROW LEVEL SECURITY;
ALTER TABLE itens_pedido ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Sem acesso anonimo - usuarios"
    ON usuarios FOR ALL TO anon USING (false);

CREATE POLICY "Sem acesso anonimo - produtos"
    ON produtos FOR ALL TO anon USING (false);

CREATE POLICY "Sem acesso anonimo - pedidos"
    ON pedidos FOR ALL TO anon USING (false);

CREATE POLICY "Sem acesso anonimo - itens_pedido"
    ON itens_pedido FOR ALL TO anon USING (false);

-- ------------------------------------------------------------
-- USUÁRIO INICIAL (descomente para primeiro teste)
-- Troque o hash pelo gerado com bcrypt no seu backend:
--   node -e "const b=require('bcrypt');b.hash('sua_senha',10).then(console.log)"
-- ------------------------------------------------------------
-- INSERT INTO usuarios (nome, email, senha_hash)
-- VALUES ('Vendedora', 'vendedora@email.com', '$2b$10$HASH_GERADO_PELO_BCRYPT');