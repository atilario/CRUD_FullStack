# 📚 Laboratório de Desenvolvimento de Sistemas · Cadastro de Alunos

Projeto desenvolvido como prática da disciplina de Laboratório de Desenvolvimento de Sistemas, implementando um CRUD mínimo com **TypeScript**, **Node.js/Express** e banco de dados relacional **MySQL**.

---

## 👥 Equipe de Desenvolvimento
- **Átila Leite**
- **Heitor Barreto**
- **Camila Rocha**
- **Maria Fernanda Ribeiro**

---

## 🚀 Tecnologias Utilizadas

- **Backend:** Node.js, Express, TypeScript, mysql2 (com pooling e suporte a Promises), dotenv
- **Frontend:** HTML5 semântico, CSS3 moderno e responsivo, TypeScript compilado para JavaScript no navegador
- **Banco de Dados:** MySQL 8.0 (com consultas parametrizadas contra SQL Injection)

---

## 📁 Estrutura do Projeto

```text
CRUD_FULLSTACK/
├── .env.example              # Modelo de configuração de variáveis de ambiente
├── .gitignore                # Proteção contra envio de node_modules, dist e .env
├── banco.sql                 # Script DDL de criação do banco e tabela alunos
├── package.json              # Metadados e scripts npm do projeto
├── tsconfig.json             # Configuração TypeScript do backend
├── tsconfig.frontend.json    # Configuração TypeScript do frontend
├── src/
│   ├── server.ts             # Inicialização do servidor Express e rotas
│   ├── config/
│   │   └── database.ts       # Pool de conexões MySQL e teste de conectividade
│   ├── routes/
│   │   └── alunos.ts         # Rotas de cadastro (POST), consulta (GET) e exclusão (DELETE)
│   └── types/
│       └── aluno.ts          # Interfaces e contratos de tipos
└── public/
    ├── index.html            # Estrutura da interface com acessibilidade
    ├── css/
    │   └── style.css         # Folha de estilos responsiva
    ├── ts/
    │   └── app.ts            # Código TypeScript do cliente HTTP (fetch API)
    └── js/
        └── app.js            # JavaScript gerado a partir do app.ts
```

---

## ⚙️ Como Executar o Projeto Localmente

### 1. Clonar o repositório
```bash
git clone https://github.com/atilario/CRUD_FullStack.git
cd CRUD_FullStack
```

### 2. Configurar o Banco de Dados MySQL
Execute o script [`banco.sql`](./banco.sql) no seu MySQL Server:
```bash
mysql -u root -p < banco.sql
```

### 3. Configurar as Variáveis de Ambiente
Copie o arquivo `.env.example` para `.env` e ajuste as credenciais do seu MySQL local:
```bash
cp .env.example .env
```
*(No Windows: `copy .env.example .env`)*

Edite o arquivo `.env`:
```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=sua_senha_aqui
DB_NAME=aula_mysql
PORT=3000
```

### 4. Instalar as Dependências
```bash
npm install
```

### 5. Compilar o Projeto
Para compilar backend e frontend:
```bash
npm run build
```

### 6. Iniciar a Aplicação
```bash
npm start
```
Ou execute o comando de atalho:
```bash
npm run dev
```

Acesse no navegador: **`http://localhost:3000`**

Para checar a integridade da API: **`http://localhost:3000/api/health`**

---

## 🧪 Operações Suportadas (CRUD)

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| `POST` | `/api/alunos` | Cadastra um novo aluno (`nome`, `email`, `curso`) |
| `GET` | `/api/alunos` | Lista todos os alunos cadastrados |
| `GET` | `/api/alunos?nome=...` | Filtra alunos pelo nome |
| `DELETE` | `/api/alunos/:id` | Remove o aluno correspondente ao ID informado |
| `GET` | `/api/health` | Verifica a saúde e disponibilidade do servidor |

---

## 🔒 Segurança

- O navegador não se conecta diretamente ao banco de dados; todas as operações trafegam por endpoints HTTP seguros.
- Todas as consultas ao MySQL são parametrizadas com placeholders `?`, prevenindo ataques de SQL Injection.
- Validações de tipos, tamanhos de campos e formatos de e-mail são aplicadas tanto no cliente quanto no servidor.
