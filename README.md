- Compléter le Dockerfile afin de builder correctement l’application contenu dans src/

```Dockerfile
FROM node:12-alpine3.9

COPY ./src ./src
COPY ./package.json .

RUN npm install --omit=dev

CMD ["node", "src/index.js"]
```

- Une option de npm vous permet de n’installer que ce qui est nécessaire. Quelle est cette option ?

Dans les versions récentes de npm il est possible d'utiliser l'option "--omit" ou "--only" pour spécifier d'installer uniquement les dépdendances de production.
Pour les versions plus anciennes, l'option "--production" est disponnible

- Quelle bonne pratique Docker permet t-elle de respecter ?

Cela permet de construire une image minimale avec uniquement le nécéssaire ce qui fait écho à une des bonnes pratiques concernant docker qui est : "Keep your images small".
