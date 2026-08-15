CHANGES - Melhorias realizadas

Resumo das alterações feitas pelo assistente:

- Correções de lógica
  - Corrigido cálculo de `currentWeekOffset` para não deslocar tarefas quando o relógio do sistema é alterado.
  - Preservado `weekStartKey` ao salvar o estado para evitar sobrescrita automática que causava avanço de tarefas.

- UI / UX
  - Bolinhas de tarefa (dots) sempre vermelhas no modo `viewer`.
  - Bolinha expirada: quando data já passou, mostra bolinha cinza com opacidade 20% (`.lesson-dot.expired`).
  - Tarefas vencidas também são marcadas na lista `pending` com visual `expired` e rótulo "vencida".
  - Removidos os cards "Tarefas (salvas no aparelho)" e "Feitas (progresso geral)" do viewer.
  - Adicionadas animações sutis: pulso nas bolinhas ativas, transições suaves em lições e tarefas, animação de entrada/estado vencido.

- Performance / Código
  - Usado event delegation para cliques nas aulas (melhor performance que reatribuir listeners repetidamente).
  - Adicionado `debounce` na caixa de busca para reduzir re-renders.
  - Pequenas otimizações e limpeza de código JS/CSS.

- Service Worker
  - Revisados `sw-viewer.js` e `sw.js` — ambos apenas tratam cache e não mexem em `localStorage`.

Testes recomendados

1. Abrir `viewer.html` e verificar a aparência geral e animações.
2. Testar a pesquisa de tarefas e confirmar que a lista filtra com debounce.
3. Alterar a data do sistema (ex.: voltar 8 dias) e recarregar: tarefas NÃO devem avançar para próxima semana.
4. Criar/editar/excluir tarefas (fora do viewer) e validar sincronização local.

Notas finais

Se quiser, eu posso:
- Gerar um commit Git com esta mudança (se o repositório tiver Git configurado aqui).
- Continuar polindo (melhorar tipografia, adicionar micro-interações, refatorar JS para módulos).
- Preparar um arquivo `README.md` com instruções de deploy e testes.

-- Assistente
