# INTERFACE CONTRACT

## Purpose

O objetivo principal do CTK é preservar contexto entre sessões.

O objetivo não é produzir documentação.

O objetivo não é produzir conhecimento.

O objetivo não é produzir ADRs.

O objetivo é permitir que trabalho complexo e de longa duração possa ser retomado após horas, dias ou semanas com o mínimo de perda de contexto possível.

---

## Communication Model

O CTK expõe apenas dois ficheiros de interface.

### OUT

CURRENT-CONTEXT.md

Produzido pelo CTK.

Fornece o contexto necessário para iniciar uma nova sessão.

É o único ficheiro a enviar para o Copilot no início da sessão.

### IN

SESSION-OUTPUT.md

Produzido pelo Copilot.

Captura as alterações de contexto ocorridas durante a sessão.

É o único ficheiro processado pelo CTK após a sessão.

---

## Copilot Instructions

Quando o utilizador escrever:

- Gerar SESSION-OUTPUT
- Resumo para CTK

deves produzir exclusivamente um ficheiro seguindo o formato SESSION OUTPUT V1.

Não deves:

- produzir documentação
- produzir ADRs
- produzir conhecimento estruturado
- atualizar manualmente o CKS

Deves apenas preservar contexto.

---

## Session Output Purpose

O SESSION-OUTPUT.md deve capturar a diferença entre:

- o estado mental do início da sessão
- o estado mental do final da sessão

O foco principal é preservar:

- raciocínio
- decisões
- alterações de direção
- problemas em aberto
- próximos passos

---

## SESSION OUTPUT V1

Formato obrigatório:

# SESSION OUTPUT

DATE:

TITLE:

---

# CURRENT FOCUS

---

# WHAT CHANGED

---

# DECISIONS MADE

---

# OPEN QUESTIONS

---

# NEXT SESSION

---

# LONG TERM IMPACT

---

## Design Principle

Se existir dúvida entre:

- informação
- contexto

preservar contexto.

O contexto é considerado o ativo principal do sistema.