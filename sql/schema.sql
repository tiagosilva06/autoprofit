-- AutoProfit Analysis 
-- Estrutura do banco de dados

CREATE TABLE IF NOT EXISTS models(
    id INTEGER PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    model_name TEXT NOT NULL,
    brand TEXT NOT NULL,
    segment TEXT NOT NULL,
    engine_size INTEGER,
    launch_year INTEGER
);