# Sistema de Gestão de Pedidos

Protótipo funcional de aplicação web para gestão de pedidos e catálogo de produtos de uma microempreendedora de confeitaria artesanal.

> Projeto Interdisciplinar — 5º Período Matutino (2026)  
> Disciplinas: DevOps | Segurança e Auditoria da Informação

---

## Tecnologias

- **Frontend:** HTML5, CSS3, JavaScript
- **Backend:** Node.js + Express
- **Banco de dados:** PostgreSQL via Supabase
- **Deploy:** Vercel (frontend) + Render (backend)

---

## Como rodar localmente

**Pré-requisitos:** Node.js 18+ e conta no [Supabase](https://supabase.com)

```bash
# Clone o repositório
git clone https://github.com/andeAraujo/sistema-gestao-pedidos.git
cd sistema-gestao-pedidos

# Instale as dependências
cd backend
npm install

# Configure as variáveis de ambiente
cp .env.example .env
# Edite o .env com suas credenciais

# Inicie o servidor
npm run dev
```

---

## Documentação

- [`docs/guia-commits-branches.md`](docs/guia-commits-branches.md) — padrão de commits e fluxo de branches
- [`docs/kanban-cards.md`](docs/kanban-cards.md) — cards/guia do quadro Kanban utilizados nesse projeto
- [`database/schema.sql`](database/schema.sql) — schema do banco de dados
