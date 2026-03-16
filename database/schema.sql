-- ============================================================
-- Schema do banco de dados — Sistema de Gestão de Pedidos
-- Execute este script no SQL Editor do Supabase
-- ============================================================

-- Tabela: usuários (vendedora)
CREATE TABLE usuarios (
  id         SERIAL PRIMARY KEY,
  nome       VARCHAR(100) NOT NULL,
  email      VARCHAR(150) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tabela: produtos
CREATE TABLE produtos (
  id         SERIAL PRIMARY KEY,
  nome       VARCHAR(150) NOT NULL,
  preco      NUMERIC(10, 2) NOT NULL,
  descricao  TEXT,
  imagem_url TEXT,
  ativo      BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tabela: pedidos
CREATE TABLE pedidos (
  id            SERIAL PRIMARY KEY,
  usuario_id    INTEGER REFERENCES usuarios(id),
  cliente_nome  VARCHAR(150) NOT NULL,
  telefone      VARCHAR(20),
  endereco      TEXT,
  data_entrega  DATE,
  valor_total   NUMERIC(10, 2) NOT NULL DEFAULT 0,
  status        VARCHAR(20) NOT NULL DEFAULT 'pendente'
                CHECK (status IN ('pendente', 'confirmado', 'entregue')),
  data_pedido   TIMESTAMP DEFAULT NOW()
);

-- Tabela: itens_pedido
CREATE TABLE itens_pedido (
  id             SERIAL PRIMARY KEY,
  pedido_id      INTEGER NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE,
  produto_id     INTEGER NOT NULL REFERENCES produtos(id),
  quantidade     INTEGER NOT NULL CHECK (quantidade > 0),
  preco_unitario NUMERIC(10, 2) NOT NULL,
  subtotal       NUMERIC(10, 2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED
);

-- ============================================================
-- Índices para performance
-- ============================================================
CREATE INDEX idx_pedidos_status ON pedidos(status);
CREATE INDEX idx_pedidos_data ON pedidos(data_pedido);
CREATE INDEX idx_itens_pedido_id ON itens_pedido(pedido_id);

-- ============================================================
-- Usuário inicial (troque a senha após o primeiro login)
-- A senha abaixo é um hash bcrypt de "admin123" — só para teste
-- ============================================================
-- INSERT INTO usuarios (nome, email, senha_hash)
-- VALUES ('Vendedora', 'vendedora@email.com', '$2b$10$HASH_GERADO_PELO_BCRYPT');
