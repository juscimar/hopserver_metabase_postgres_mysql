# 📊 Projeto de integração usando Docker compose, HopServer, Metabase, Postgres, MySql, PgAdmin, PhpMyAdmin

![Docker](https://img.shields.io/badge/Docker-Compose-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14.15-blue)
![Metabase](https://img.shields.io/badge/Metabase-0.51.10-yellow)
![PgAdmin](https://img.shields.io/badge/PgAdmin-8.14.0-orange)
![Apache Hop](https://img.shields.io/badge/Apache_Hop-2.11.0-green)
![MySQL](https://img.shields.io/badge/MySQL-9.1.0-red)
![PhpMyAdmin](https://img.shields.io/badge/PhpMyAdmin-5.2.1-lightgrey)

Este projeto configura um ambiente integrado com diversas ferramentas úteis para análise, gestão de dados e pipelines. Ele inclui serviços como Apache Hop Server, Metabase, PostgreSQL, MySQL, PgAdmin e PhpMyAdmin.

## 🚀 Serviços Configurados

### 1. **Hop Server**
- **Porta**: `8080`
- **Descrição**: Ferramenta para orquestração de pipelines e fluxos de trabalho ETL.

### 2. **Metabase**
- **Porta**: `3000`
- **Descrição**: Plataforma de business intelligence para visualização e análise de dados.

### 3. **PostgreSQL**
- **Porta**: `5432`
- **Descrição**: Banco de dados relacional robusto e escalável.

### 4. **PgAdmin**
- **Porta**: `5050`
- **Descrição**: Interface gráfica para administração do PostgreSQL.

### 5. **MySQL**
- **Porta**: `3306`
- **Descrição**: Banco de dados relacional amplamente utilizado.

### 6. **PhpMyAdmin**
- **Porta**: `8000`
- **Descrição**: Interface gráfica para administração do MySQL.

---

## 🛠️ Configuração do Projeto

### Pré-requisitos

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Estrutura de Arquivos

```plaintext
/
├── hopserver_metabase_postgres/
│   ├── utils/
│   │   ├── create-db.sql
│   │   ├── mysql-connector-j-8.4.0.jar
├── .env
├── docker-compose.yml
├── Dockerfile
└── README.md
```

---

## 🔧 Como Usar

### 1. Clone o Repositório
```bash
git clone https://github.com/seu-usuario/seu-projeto.git
cd seu-projeto
```

### 2. Configure Variáveis de Ambiente
Edite o arquivo `.env-example` para `.env`  no diretório raiz e configure as variáveis, para subir os containers:

```env
#*************************************************
# Configurações do banco de dados Postgres
#*************************************************
POSTGRES_HOST="CHANGE-ME"
POSTGRES_USER="CHANGE-ME"
POSTGRES_PASSWORD="CHANGE-ME"
POSTGRES_DB="CHANGE-ME"
POSTGRES_PORT="CHANGE-ME"  # Porta interna do container
POSTGRES_PORT_HOST="CHANGE-ME"  # Porta do host local

#*************************************************
# Configurações do banco de dados Metabase
#*************************************************
POSTGRES_METABASE_HOST="CHANGE-ME"
POSTGRES_METABASE_USER="CHANGE-ME"
POSTGRES_METABASE_PASSWORD="CHANGE-ME"
POSTGRES_METABASE_DB="CHANGE-ME"
POSTGRES_METABASE_HOST_PORT="CHANGE-ME"  # Porta exposta para o host
POSTGRES_METABASE_PORT="CHANGE-ME"  # Porta interna do postgres metabase

#*************************************************
# Configurações do PgAdmin
#*************************************************
PGADMIN_DEFAULT_EMAIL="CHANGE-ME"
PGADMIN_DEFAULT_PASSWORD="CHANGE-ME"
PGADMIN_PORT="CHANGE-ME"  # Porta exposta para o host

#*************************************************
# Configurações do Apache Hop Server
#*************************************************
HOP_OPTIONS="-Xmx2048m -Dfile.encoding=UTF8"
HOP_LOG_LEVEL="Basic"
HOP_SERVER_USER="CHANGE-ME"
HOP_SERVER_PASS="CHANGE-ME"
HOP_SERVER_HOSTNAME="0.0.0.0"

#*************************************************
# Configurações do banco de dados MySql
#*************************************************
MYSQL_HOST="CHANGE-ME"
MYSQL_USER="CHANGE-ME"
MYSQL_PASSWORD="CHANGE-ME"
MYSQL_DATABASE="CHANGE-ME"
MYSQL_ROOT_PASSWORD="CHANGE-ME"
MYSQL_PORT="CHANGE-ME"
```

> **Importante:** Todas as variáveis obrigatórias devem estar configuradas no arquivo `.env` para que os serviços sejam inicializados corretamente.

### 3. Verifique o Driver do MySQL
Certifique-se de que o arquivo `mysql-connector-j-8.4.0.jar` está presente no diretório `utils` para permitir a conexão do Hop Server com o MySQL.

### 4. Suba os Contêineres

```bash
docker-compose up -d
```

### 5. Acesse os Serviços
- **Hop Server**: [http://localhost:8080](http://localhost:8080)
- **Metabase**: [http://localhost:3000](http://localhost:3000)
- **PgAdmin**: [http://localhost:5050](http://localhost:5050)
- **PhpMyAdmin**: [http://localhost:8081](http://localhost:8000)

---

## 📂 Detalhes de Configuração

### **Hop Server**
- Volume de configuração montado em `/usr/local/tomcat/webapps/ROOT/config`.

### **Metabase**
- Configuração do banco de dados em `./utils`.

### **PostgreSQL**
- Arquivos de inicialização no diretório `./utils/create-db.sql`.
- Volume montado em `postgres_data_hop`, caso prefira, pode mudar de local

### **MySQL**
- Volume montado em `mysql_data_hop`, caso prefira, pode mudar de local

---

## 📝 Notas

- Para garantir que as configurações sejam carregadas corretamente, certifique-se de que os arquivos de inicialização SQL estejam no diretório correto.
- Caso precise parar e remover os contêineres, use:

```bash
docker-compose down
```

---

## 🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

---

## 📜 Licença
Este projeto está sob a licença [MIT](LICENSE).
