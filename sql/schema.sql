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

CREATE TABLE IF NOT EXISTS prices (
    id              INTEGER PRIMARY KEY,
    model_id        INTEGER NOT NULL REFERENCES models(id),
    month_ref       TEXT NOT NULL,
    list_price      REAL NOT NULL,
    dealer_price    REAL NOT NULL,
    max_discount    REAL NOT NULL,
    factory_cost    REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS sales (
    id              INTEGER PRIMARY KEY,
    model_id        INTEGER NOT NULL REFERENCES models(id),
    month_ref       TEXT NOT NULL,
    units           INTEGER NOT NULL,
    total_revenue   REAL NOT NULL,
    avg_discount    REAL NOT NULL
);