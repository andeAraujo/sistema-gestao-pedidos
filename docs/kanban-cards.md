# Quadro Kanban — GitHub Projects
## sistema-gestao-pedidos

Criar um novo Project no GitHub (aba "Projects" do repositório) com as
colunas abaixo e adicione os cards na ordem indicada.

---

## COLUNA: ✅ Concluído

---
**[INFRA] Criar repositório e configurar estrutura de pastas**
- Responsável: Dev 3
- Prazo: 17/03 ✅ Concluído
- Tarefas:
  - [x] Criar repo `sistema-gestao-pedidos` no GitHub
  - [x] Adicionar README, .gitignore, .env.example
  - [x] Criar estrutura de pastas (frontend/, backend/, database/, docs/)
  - [x] Criar branch `develop` a partir da `main`
  - [x] Configurar proteção da branch `main` (exigir PR + 1 aprovação)
  - [x] Criar quadro Kanban no GitHub Projects

---
**[INFRA] Configurar banco de dados no Supabase**
- Responsável: Dev 3
- Prazo: 18/03 ✅ Concluído
- Tarefas:
  - [x] Criar conta e projeto no Supabase
  - [x] Executar `database/schema.sql` no SQL Editor do Supabase (3 tabelas: produtos, pedidos, itens_pedido)
  - [x] Ativar Supabase Auth: Authentication → Settings → habilitar provider Email
  - [x] Criar usuária inicial pelo painel: Authentication → Users → Add user (e-mail + senha)
  - [x] Salvar credenciais (SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY, SUPABASE_SECRET_KEY) no .env.example preenchido — compartilhar com equipe de forma segura, nunca commitar no repo

## COLUNA: 📋 Backlog

### FASE I — até Defesa Parcial (26/03–01/04)

---
**[INFRA] Criar workflows de CI/CD**
- Responsável: Dev 3
- Prazo: 18/03
- Branch: `feature/ci-cd-setup`
- Tarefas:
  - Criar `.github/workflows/ci-develop.yml` — acionado em PR para `develop`: instalar deps, verificar inicialização do servidor, rodar testes (quando existirem)
  - Criar `.github/workflows/ci-main.yml` — acionado em PR para `main`: repetir CI + build + trigger de deploy
  - Criar `.github/pull_request_template.md` com campos: descrição, tipo de mudança, checklist de testes
  - Testar pipeline com um PR de exemplo
  - Abrir PR para `develop`
- Observação: pipeline criado agora (início do projeto), não após o backend estar pronto

---
**[BACKEND] Configurar servidor Node.js + Express**
- Responsável: Dev 2
- Prazo: 18/03
- Branch: `feature/backend-setup`
- Tarefas:
  - Inicializar package.json (`npm init`)
  - Instalar dependências: express, @supabase/supabase-js, dotenv, cors
  - Criar server.js básico com rota de health check (`GET /`)
  - Configurar cliente Supabase com SUPABASE_SECRET_KEY (acesso total, ignora RLS)
  - Abrir PR para `develop`
- Observação: `bcrypt` e `jsonwebtoken` removidos — autenticação gerenciada pelo Supabase Auth

---
**[BACKEND] Configurar autenticação com Supabase Auth**
- Responsável: Dev 2
- Prazo: 19/03
- Branch: `feature/auth-backend`
- Tarefas:
  - Criar middleware `authenticateUser` que valida o token JWT do Supabase (header `Authorization: Bearer <token>`)
  - Usar `supabase.auth.getUser(token)` para verificar autenticidade — sem validação manual de JWT
  - Aplicar middleware em todas as rotas protegidas (produtos e pedidos)
  - Testar middleware com token válido e inválido
  - Abrir PR para `develop`

---
**[FRONTEND] Criar tela de login**
- Responsável: Dev 1
- Prazo: 19/03
- Branch: `feature/login-page`
- Tarefas:
  - Criar `login.html` com formulário (e-mail + senha)
  - Criar `css/style.css` com layout responsivo básico
  - Adicionar SDK do Supabase via CDN no `<head>` de todas as páginas: `<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>`
  - Criar `js/supabase-client.js` — inicializar cliente com SUPABASE_URL e SUPABASE_PUBLISHABLE_KEY (variáveis públicas, seguro usar no frontend)
  - Criar `js/auth.js` — usar `supabase.auth.signInWithPassword({ email, password })` para autenticar
  - Sessão gerenciada automaticamente pelo SDK do Supabase (sem localStorage manual)
  - Redirecionar para painel após login bem-sucedido
  - Tratar erros (credenciais inválidas, campo vazio)
  - Criar `js/auth.js` — incluir função de logout usando `supabase.auth.signOut()` com botão visível no painel
  - Abrir PR para `develop`

---
**[BACKEND] CRUD de produtos**
- Responsável: Dev 2
- Prazo: 20/03
- Branch: `feature/produtos-backend`
- Tarefas:
  - `GET /produtos` — listar todos os produtos ativos
  - `GET /produtos/:id` — retornar produto individual (necessário para tela de edição)
  - `POST /produtos` — criar produto (protegido por middleware de auth)
  - `PUT /produtos/:id` — editar produto (protegido por middleware de auth)
  - `DELETE /produtos/:id` — remover produto (protegido por middleware de auth)
  - Abrir PR para `develop`

---
**[FRONTEND] Páginas de produtos (catálogo + cadastro)**
- Responsável: Dev 1
- Prazo: 21/03
- Branch: `feature/produtos-frontend`
- Tarefas:
  - Criar `produtos.html` com listagem do catálogo
  - Formulário de cadastro/edição de produto
  - `js/produtos.js` — integração com API (listar, criar, editar, excluir)
  - Buscar produto individual via `GET /produtos/:id` para popular formulário de edição
  - Proteger páginas no frontend: verificar `supabase.auth.getSession()` ao carregar `produtos.html` e `pedidos.html` — redirecionar para `login.html` se não houver sessão ativa
  - Abrir PR para `develop`

---
**[DEV3] Revisar artigo parcial no Overleaf**
- Responsável: Dev 3
- Prazo: 22/03
- Tarefas:
  - Adicionar seção de Metodologia (Kanban + GitHub Projects)
  - Adicionar seção de Tecnologias Utilizadas (incluir decisão do Supabase Auth)
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
  - `POST /pedidos` — registrar pedido com itens (protegido por middleware de auth)
  - `GET /pedidos` — listar todos os pedidos
  - `GET /pedidos/:id` — retornar pedido individual com itens (necessário para tela de detalhes)
  - `PUT /pedidos/:id/status` — atualizar status do pedido
  - Cálculo automático de `valor_total` no backend antes de inserir
  - Abrir PR para `develop`

---
**[FRONTEND] Página de pedidos + painel**
- Responsável: Dev 1
- Prazo: 17/04
- Branch: `feature/pedidos-frontend`
- Tarefas:
  - `pedidos.html` — formulário de novo pedido
  - Seleção de produtos e quantidade
  - Cálculo de total em tempo real
  - Painel com listagem e atualização de status
  - Buscar detalhes do pedido via `GET /pedidos/:id`
  - `js/pedidos.js` — integração com API
  - Confirmar proteção de página: `supabase.auth.getSession()` no carregamento — validar que `pedidos.html` redireciona para `login.html` se não houver sessão ativa (implementado no card de produtos, garantir cobertura aqui também)
  - Abrir PR para `develop`

---
**[BACKEND] Testes unitários**
- Responsável: Dev 2
- Prazo: 17/04
- Branch: `test/unitarios`
- Tarefas:
  - Instalar Jest (`npm install --save-dev jest`)
  - Testar função de cálculo de `valor_total` (lógica de negócio, isolada do banco)
  - Testar função de validação de dados de entrada (campos obrigatórios, tipos, limites)
  - Configurar script `"test": "jest"` no `package.json`
  - Garantir que o pipeline de CI rode `npm test` automaticamente
  - Abrir PR para `develop`

---
**[BACKEND] Testes de integração**
- Responsável: Dev 2
- Prazo: 24/04
- Branch: `test/integracao`
- Tarefas:
  - Instalar Supertest (`npm install --save-dev supertest`)
  - Testar `GET /produtos` — lista retornada corretamente
  - Testar `GET /produtos/:id` — produto individual e caso não encontrado (404)
  - Testar `POST /pedidos` — criação com itens válidos
  - Testar `GET /pedidos/:id` — pedido individual com itens
  - Testar `PUT /pedidos/:id/status` — atualização de status válido e inválido
  - Testar middleware de autenticação: requisição sem token deve retornar 401
  - Abrir PR para `develop`
- Observação: autenticação testada via token gerado pelo Supabase Auth SDK, não por mock manual

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
**[DEV3] Segurança — proteção e validações**
- Responsável: Dev 3
- Prazo: 24/04
- Branch: `feature/seguranca`
- Tarefas:
  - Confirmar que middleware `authenticateUser` está aplicado em todas as rotas protegidas
  - Confirmar que SUPABASE_SECRET_KEY e SUPABASE_URL estão isolados no `.env` (nunca no repo)
  - Validação e sanitização de entrada no backend (todos os campos dos formulários)
  - Verificar que RLS está habilitado nas 3 tabelas (produtos, pedidos, itens_pedido)
  - Confirmar HTTPS ativo nas URLs de produção (Vercel + Render)
  - Abrir PR para `develop`
- Observação: bcrypt e JWT removidos das responsabilidades — gerenciados pelo Supabase Auth

---
**[DEV3] Deploy da aplicação**
- Responsável: Dev 3
- Prazo: 02/05
- Branch: `feature/deploy`
- Tarefas:
  - Deploy do frontend no Vercel (conectar ao repo, deploy automático na `main`)
  - Deploy do backend no **Render** (Railway descartado — free tier instável)
  - Configurar variáveis de ambiente em produção nos painéis da Vercel e do Render
  - Testar aplicação em produção end-to-end
  - Documentar URLs de produção no README

---
**[EQUIPE] Testes com a usuária real**
- Responsável: Equipe
- Prazo: 09/05
- Tarefas:
  - Agendar sessão de teste com a microempreendedora (agendar com antecedência — recurso externo)
  - Preparar roteiro de teste (fluxo: login → cadastro de produto → registro de pedido → atualização de status)
  - Coletar feedback por escrito
  - Registrar evidências (prints, anotações) para o Relatório de Implementação

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
4. Mova o card **[INFRA] Criar repositório** direto para a coluna **✅ Concluído**
5. Adicione os demais cards na coluna **Backlog**, na ordem indicada
6. Para cada card, defina:
   - **Assignee** (responsável)
   - **Due date** (prazo)
   - **Label**: `infra` / `frontend` / `backend` / `docs` / `segurança`
7. Quando começar uma tarefa, mova o card para **Em Progresso**
8. Ao abrir o PR, mova para **Em Revisão**
9. Após merge aprovado, mova para **Concluído**