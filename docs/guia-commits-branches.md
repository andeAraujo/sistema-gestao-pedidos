# Guia Rápido — Commits e Branches
## sistema-gestao-pedidos

Mantenha esse arquivo aberto enquanto trabalha. Siga o padrão para que
o histórico do projeto fique limpo e profissional para a banca.

---

## Padrão de Commits

```
tipo(escopo): descrição curta em minúsculas
```

### Tipos

| Tipo | Quando usar | Exemplo |
|------|-------------|---------|
| `feat` | Nova funcionalidade | `feat(auth): implementar login com JWT` |
| `fix` | Corrigir um bug | `fix(pedidos): corrigir cálculo do valor total` |
| `docs` | Documentação | `docs(readme): atualizar instruções de instalação` |
| `style` | Formatação/CSS, sem mudança de lógica | `style(login): ajustar responsividade mobile` |
| `refactor` | Reorganizar código sem mudar comportamento | `refactor(produtos): extrair validação para função` |
| `test` | Testes | `test(auth): adicionar teste de login inválido` |
| `chore` | Configuração, dependências | `chore(deps): adicionar bcrypt ao package.json` |

### Escopos sugeridos

`auth` · `produtos` · `pedidos` · `painel` · `db` · `deploy` · `deps` · `readme`

---

## Fluxo de Branches

```
main          ← produção (deploy automático, nunca commitar direto)
  └── develop ← integração (base para todas as features)
        ├── feature/auth-backend
        ├── feature/login-page
        ├── feature/produtos-backend
        ├── feature/produtos-frontend
        ├── feature/pedidos-backend
        ├── feature/pedidos-frontend
        └── fix/nome-do-bug
```

### Criar uma branch nova

```bash
# Sempre a partir da develop
git checkout develop
git pull origin develop
git checkout -b feature/nome-da-feature
```

### Enviar para o GitHub e abrir PR

```bash
git add .
git commit -m "feat(escopo): descrição"
git push origin feature/nome-da-feature
# Depois abra o Pull Request no GitHub apontando para develop
```

### Após merge do PR ser aprovado

```bash
# Voltar para develop e atualizar local
git checkout develop
git pull origin develop

# Deletar branch local que já foi mergeada
git branch -d feature/nome-da-feature
```

---

## Regras da Equipe

- ❌ Nunca commitar direto na `main` ou na `develop`
- ❌ Nunca commitar o arquivo `.env` (ele está no .gitignore)
- ✅ Todo código entra via Pull Request
- ✅ Todo PR precisa de ao menos 1 aprovação antes do merge
- ✅ Use o template de PR preenchendo todos os campos
- ✅ Mova o card do Kanban conforme o andamento da tarefa

---

## Comandos úteis do dia a dia

```bash
# Ver status dos arquivos modificados
git status

# Ver histórico de commits
git log --oneline

# Atualizar branch local com o que está no GitHub
git pull origin nome-da-branch

# Desfazer último commit (mantendo as alterações)
git reset --soft HEAD~1

# Ver branches disponíveis
git branch -a
```
