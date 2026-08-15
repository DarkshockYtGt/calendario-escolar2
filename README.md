# Calendário Escolar 9º B

Versão de visualização do calendário escolar. Interface leve em HTML/CSS/JS para visualizar aulas e tarefas.

Como usar (local):

- Abra `index.html` para a aplicação principal ou `viewer.html` para o modo de visualização.
- A aplicação é estática — pode ser aberta direto no navegador ou servida por um servidor simples.

Deploy rápido com Firebase Hosting:

1. Instale o Firebase CLI: `npm install -g firebase-tools`
2. Faça login: `firebase login`
3. No diretório do projeto: `firebase init hosting` (escolha o projeto e a pasta pública)
4. Envie: `firebase deploy --only hosting`

Próximos passos possíveis:

- Integrar Firebase Firestore para sincronização de tarefas.
- Configurar FCM (push notifications) — posso gerar os snippets cliente/servidor.

Contato: crie uma issue no repositório quando precisar de ajuda.
