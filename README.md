- Compléter le Dockerfile afin de builder correctement l’application contenu dans src/

```bash
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

- A l’aide de la commande docker build, créer l’image ma_super_app

```bash
docker build -t ma_super_app .
```

- Compléter le fichier docker-compose.yml afin d’éxécuter ma_super_app avec sa base de données.
```yaml
version: "3.9"

services:
  node:
    container_name: node
    build: 
      context: .
      dockerfile: ./Dockerfile
      tags:
        - my_super_app:1.0.0
    depends_on:
      - mysql 
    ports:
      - 3000:3000
    env_file:
      - .env

  mysql:
    container_name: mysql
    image: mysql:5.7
    ports:
      - 3306:3306
    environment:
      MYSQL_DATABASE: ${DATABASE_NAME}
      MYSQL_USER: ${DATABASE_USERNAME}
      MYSQL_PASSWORD: ${DATABASE_PASSWORD}
      MYSQL_ROOT_PASSWORD: ${DATABASE_PASSWORD}
```
