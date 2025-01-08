# Projeto padrão PHP + Laravel com Vue.js, Inertia.js e MySQL

Este guia descreve como configurar o ambiente para o Laravel com Vue.js, Inertia.js e MySQL, usando Docker para gerenciar os contêineres.

## Passo a Passo para Configuração do Projeto

### **1. Clone o repositório:**

```
git clone git@github.com:fffilipi/default-laravel-docker.git
```

### **2. Acesse a pasta do projeto**

```
cd project-laravel
```

### **3. Suba os containers Docker**

Suba os contêineres necessários (com a opção --build para garantir que as imagens sejam construídas corretamente e -d para rodar em segundo plano):

```
docker-compose up --build -d
```

### **4. Instale as dependências do Laravel (dentro do contêiner)**
Acesse o contêiner do Laravel e instale as dependências do Composer:

```
docker-compose exec app bash
composer install
php artisan migrate
```

### **5. Instale as dependências do Vue.js**
Acesse o contêiner Node.js e instale as dependências do Vue.js:

```
docker-compose exec node bash
npm install
```

### **6. Rode o servidor Vite**
Dentro do contêiner Node.js, rode o servidor Vite para o frontend:

```
npm run dev
```

### **7. Crie o arquivo .env a partir do exemplo:**
Configure as variáveis de ambiente para o seu projeto Laravel no arquivo .env. Certifique-se de que as configurações do banco de dados e outras dependências estão corretas.

```
cp .env.example .env
```

### **8. Criar o Banco de Dados MySQL**
Agora, você precisará criar o banco de dados MySQL. Siga as etapas abaixo para configurar o banco de dados via comandos MySQL no contêiner.
Acesse o contêiner do banco de dados (MySQL)
Entre no contêiner que está rodando o MySQL:

```
docker-compose exec db bash
```
### **9. Criar o Banco de Dados MySQL**
Acesse o banco de dados MySQL
Abra o MySQL dentro do contêiner:

```
mysql -u root -p
```

Após isso, digite a senha do root que você configurou no arquivo docker-compose.yml.

### **10. Crie o banco de dados**
No prompt do MySQL, crie o banco de dados para o Laravel:

```
CREATE DATABASE default_laravel;
```

### **11. Saia do MySQL**
Após criar o banco de dados, você pode sair do MySQL com o comando:

```
exit
```

### **12. Rodar as Migrations**
Agora que o banco de dados foi criado, é hora de rodar as migrations para criar as tabelas necessárias no banco de dados.

No contêiner app, execute o seguinte comando para rodar as migrations:

```
docker-compose exec app php artisan migrate
```

### **13. Acesse o projeto localmente no navegador:**

    Laravel (backend): http://localhost:8000

### **Ambiente Pronto! 🚀**
Com isso, você terá um ambiente Laravel configurado no backend, Vue com Vite no frontend, e MySQL como banco de dados, tudo rodando dentro de contêineres Docker!

Esse passo a passo deve cobrir as etapas essenciais para a configuração do seu ambiente de desenvolvimento. Se houver algum erro ou problema durante o processo, verifique os logs dos contêineres com o comando:

```
docker-compose logs
```
