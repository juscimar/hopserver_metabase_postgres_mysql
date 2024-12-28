-- Criar banco 'metabase' se não existir
SELECT 'CREATE DATABASE metabase OWNER postgres'
   WHERE NOT EXISTS (
         SELECT FROM pg_database WHERE datname = 'metabase'
)\gexec
