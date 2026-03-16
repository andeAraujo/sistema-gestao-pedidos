# Quadro Kanban — GitHub Projects
## sistema-gestao-pedidos

Criar um novo Project no GitHub (aba "Projects" do repositório) com as
colunas abaixo e adicione os cards na ordem indicada.

---

## COLUNA: 📋 Backlog

### FASE I — até Defesa Parcial (26/03–01/04)

---
**[INFRA] Criar repositório e configurar estrutura de pastas**
- Responsável: Dev 3
- Prazo: 17/03
- Tarefas:
  - Criar repo `sistema-gestao-pedidos` no GitHub
  - Adicionar README, .gitignore, .env.example
  - Criar estrutura de pastas (frontend/, backend/, database/, docs/)
  - Criar branch `develop` a partir da `main`
  - Configurar proteção da branch `main` (exigir PR + 1 aprovação)
  - Criar quadro Kanban no GitHub Projects

---
**[INFRA] Configurar banco de dados no Supabase**
- Responsável: Dev 3
- Prazo: 18/03
- Tarefas:
  - Criar conta e projeto no Supabase
  - Criar as 4 tabelas: usuários, produtos, pedidos, itens_pedido
  - Salvar script SQL em database/schema.sql
  - Compartilhar credenciais com a equipe via .env.example preenchido (no privado, nunca no repo)

---
**[BACKEND] Configurar servidor Node.js + Express**
- Responsável: Dev 2
- Prazo: 18/03
- Branch: `feature/backend-setup`
- Tarefas:
  - Inicializar package.json (`npm init`)
  - Instalar dependências: express, pg, bcrypt, jsonwebtoken, dotenv, cors
  - Criar server.js básico com rota de health check (GET /)
  - Conectar ao Supabase/PostgreSQL
  - Abrir PR para `develop`

---
**[BACKEND] Implementar autenticação (login + JWT)**
- Responsável: Dev 2
- Prazo: 19/03
- Branch: `feature/auth-backend`
- Tarefas:
  - Criar rota POST /login
  - Validar e-mail e senha contra banco
  - Gerar token JWT na resposta
  - Criar middleware de autenticação para proteger rotas
  - Abrir PR para `develop`

---
**[FRONTEND] Criar tela de login**
- Responsável: Dev 1
- Prazo: 19/03
- Branch: `feature/login-page`
- Tarefas:
  - Criar login.html com formulário (e-mail + senha)
  - Criar css/style.css com layout responsivo básico
  - Criar js/auth.js — POST /login, salvar token no localStorage, redirecionar
  - Tratar erros (credenciais inválidas, campo vazio)
  - Abrir PR para `develop`

---
**[BACKEND] CRUD de produtos**
- Responsável: Dev 2
- Prazo: 21/03
- Branch: `feature/produtos-backend`
- Tarefas:
  - GET /produtos — listar produtos
  - POST /produtos — criar produto (protegido por JWT)
  - PUT /produtos/:id — editar produto (protegido por JWT)
  - DELETE /produtos/:id — remover produto (protegido por JWT)
  - Abrir PR para `develop`

---
**[FRONTEND] Páginas de produtos (catálogo + cadastro)**
- Responsável: Dev 1
- Prazo: 21/03
- Branch: `feature/produtos-frontend`
- Tarefas:
  - Criar produtos.html com listagem do catálogo
  - Formulário de cadastro/edição de produto
  - js/produtos.js — integração com API (listar, criar, editar, excluir)
  - Abrir PR para `develop`

---
**[DEV3] Revisar artigo parcial no Overleaf**
- Responsável: Dev 3
- Prazo: 22/03
- Tarefas:
  - Adicionar seção de Metodologia (Kanban + GitHub Projects)
  - Adicionar seção de Tecnologias Utilizadas
  - Revisar introdução e referencial teórico
  - Enviar versão atualizada ao orientador

---
**[EQUIPE] Preparar defesa parcial**
- Responsável: Equipe
- Prazo: 25/03
- Tarefas:
  - Montar slides (introdução, problema, solução, demo do MVP, próximos passos)
  - Definir quem apresenta cada parte
  - Ensaio da apresentação

---

### FASE II — até Entrega Final (22/05)

---
**[BACKEND] Sistema de pedidos**
- Responsável: Dev 2
- Prazo: 10/04
- Branch: `feature/pedidos-backend`
- Tarefas:
  - POST /pedidos — registrar pedido com itens
  - GET /pedidos — listar pedidos
  - PUT /pedidos/:id/status — atualizar status
  - Cálculo automático de valor_total
  - Abrir PR para `develop`

---
**[FRONTEND] Página de pedidos + painel**
- Responsável: Dev 1
- Prazo: 17/04
- Branch: `feature/pedidos-frontend`
- Tarefas:
  - pedidos.html — formulário de novo pedido
  - Seleção de produtos e quantidade
  - Cálculo de total em tempo real
  - Painel com listagem e atualização de status
  - js/pedidos.js — integração com API
  - Abrir PR para `develop`

---
**[FRONTEND] Responsividade e validações**
- Responsável: Dev 1
- Prazo: 24/04
- Branch: `feature/responsividade`
- Tarefas:
  - Garantir layout funcional em mobile (RNF01)
  - Validações em todos os formulários (RNF04)
  - Abrir PR para `develop`

---
**[DEV3] Segurança — autenticação e proteção**
- Responsável: Dev 3
- Prazo: 24/04
- Branch: `feature/seguranca`
- Tarefas:
  - Confirmar hash bcrypt nas senhas
  - Verificar JWT em todas as rotas protegidas
  - Proteger variáveis sensíveis no .env
  - Validação de entrada no backend (sanitização)
  - Abrir PR para `develop`

---
**[DEV3] Deploy da aplicação**
- Responsável: Dev 3
- Prazo: 02/05
- Branch: `feature/deploy`
- Tarefas:
  - Deploy do frontend no Vercel (conectar ao repo)
  - Deploy do backend no Render ou Railway
  - Configurar variáveis de ambiente em produção
  - Testar aplicação em produção end-to-end
  - Documentar URL de produção no README

---
**[EQUIPE] Testes com a usuária real**
- Responsável: Equipe
- Prazo: 09/05
- Tarefas:
  - Agendar sessão de teste com a microempreendedora
  - Preparar roteiro de teste (fluxo: login → produto → pedido → status)
  - Coletar feedback por escrito
  - Registrar evidências (prints, anotações)

---
**[DEV1+2] Ajustes pós-teste**
- Responsável: Dev 1 + Dev 2
- Prazo: 15/05
- Tarefas:
  - Implementar correções apontadas pela usuária
  - Ajustes de interface e usabilidade
  - Abrir PR para `develop` → merge para `main`

---
**[DEV3] Relatório de Implementação na Comunidade**
- Responsável: Dev 3
- Prazo: 15/05
- Tarefas:
  - Redigir relatório descrevendo as atividades com a usuária
  - Incluir evidências, prints, feedback coletado
  - Descrever impactos observados

---
**[EQUIPE] Finalizar artigo científico**
- Responsável: Dev 3 + Equipe
- Prazo: 15/05
- Tarefas:
  - Seção de Resultados (com dados dos testes)
  - Seção de Conclusão
  - Revisão completa das referências (normas SBC)
  - Revisão final de formatação no Overleaf

---
**[EQUIPE] 🔴 Deadline interno — entrega final**
- Responsável: Equipe
- Prazo: 19/05
- Tarefas:
  - Confirmar que aplicação está funcionando em produção
  - Artigo final revisado e pronto
  - Relatório de implementação finalizado
  - Tudo pronto para submissão oficial em 22/05

---
**[EQUIPE] Preparar defesa final**
- Responsável: Equipe
- Prazo: 05/06
- Tarefas:
  - Montar slides finais (aplicação implementada, resultados, análise, demo)
  - Preparar demonstração ao vivo do sistema
  - Ensaio completo da apresentação

---

## Como criar no GitHub Projects

1. Acesse o repositório → aba **Projects** → **New project**
2. Escolha o template **Board** (Kanban)
3. Renomeie as colunas padrão para:
   - 📋 Backlog
   - 🔄 Em Progresso
   - 👀 Em Revisão
   - ✅ Concluído
4. Adicione os cards acima na coluna **Backlog**
5. Para cada card, defina:
   - **Assignee** (responsável)
   - **Due date** (prazo)
   - **Label** (infra / frontend / backend / docs / segurança)
6. Quando começar uma tarefa, mova o card para **Em Progresso**
7. Ao abrir o PR, mova para **Em Revisão**
8. Após merge aprovado, mova para **Concluído**
