// Carrega as variáveis do arquivo .env no processo do servidor.
import 'dotenv/config';
// O driver com Promise permite usar async e await.
import { createPool } from 'mysql2/promise';

const portaBanco = Number(process.env.DB_PORT ?? '3306');
if (!Number.isInteger(portaBanco) || portaBanco < 1 || portaBanco > 65535) {
  throw new Error('DB_PORT deve ser uma porta válida.');
}

// O pool reaproveita conexões. A senha nunca vai para o navegador.
export const pool = createPool({
  host: process.env.DB_HOST ?? 'localhost',
  port: portaBanco,
  user: process.env.DB_USER ?? 'root',
  password: process.env.DB_PASSWORD ?? '',
  database: process.env.DB_NAME ?? 'aula_mysql',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// async retorna uma Promise; await aguarda o teste terminar.
// Possui tentativas com intervalo para aguardar o MySQL inicializar em ambientes como Docker.
export async function testConnection(retries = 5, delayMs = 2000): Promise<void> {
  for (let attempt = 1; attempt <= retries; attempt++) {
    try {
      await pool.execute('SELECT 1');
      console.log('Conexão com MySQL estabelecida.');
      return;
    } catch (erro) {
      if (attempt === retries) {
        console.error('Falha ao conectar ao MySQL após tentativas:', erro);
        throw erro; // O servidor não deve anunciar funcionamento sem banco.
      }
      console.warn(`Tentativa ${attempt}/${retries}: aguardando MySQL responder...`);
      await new Promise((resolve) => setTimeout(resolve, delayMs));
    }
  }
}
