# 📊 AutoProfit Analytics

Um projeto de automação de dados construído com Python e SQL para analisar precificação de veículos, margem bruta e incentivos comerciais em um portfólio automotivo fictício.

---

## 📋 Sumário

- [Sobre o Projeto](#sobre-o-projeto)
- [Lógica de Negócio](#lógica-de-negócio)
- [Tecnologias](#tecnologias)
- [Arquitetura](#arquitetura)
- [Funcionalidades](#funcionalidades)
- [Como Rodar](#como-rodar)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Autor](#autor)

---

## Sobre o Projeto

**Problema:** Times de pricing automotivo precisam monitorar a margem bruta por modelo de veículo, verificar se os dealers estão respeitando os limites de desconto e gerar relatórios mensais de rentabilidade — tudo isso feito manualmente em planilhas, o que é lento e sujeito a erros.

**Decisão:** Construir um pipeline automatizado com Python e SQLite que executa queries de pricing, detecta violações de desconto e gera automaticamente um relatório Excel formatado.

**Resultado:** Um pipeline funcional que calcula margem bruta e líquida por modelo, sinaliza violações de limite de desconto e exporta um relatório Excel estruturado com múltiplas abas analíticas.

---

## 💡 Lógica de Negócio

### Estrutura de Preços
- `dealer_price` = ~85% do `list_price` (dealer compra da montadora com 15% de desconto)
- `factory_cost` = ~59% do `list_price` (custo de fabricação)
- **Margem bruta** = `dealer_price` - `factory_cost` (~25% do preço de tabela)

### Descontos
- `max_discount` = desconto máximo em % que o dealer pode oferecer ao cliente
- `avg_discount` em `sales` nunca deve ultrapassar `max_discount` em `prices`
- Se ultrapassar → **alerta de desconto disparado**
- SUVs e hatches: 7–9% (precisam de incentivo para girar volume)
- Pickups e SUVs premium: 3–5% (vendem bem sem desconto)

### Sazonalidade
- Vendas aumentam no fim do ano (Nov/Dez) — metas anuais das montadoras
- Vendas caem em fevereiro — mês curto, pós-carnaval
- Descontos médios diminuem ao longo do ano conforme o modelo ganha tração

### Incentivos
- `cashback` e `zero_rate` reduzem a margem real da montadora
- `dealer_bonus` é um custo comercial pago ao dealer por bater metas
- Meses com muitos incentivos = margem real menor que a margem bruta
- **Margem líquida** = `total_margin` - `total_incentives`

---

## Tecnologias

| Tecnologia | Finalidade |
|---|---|
| **Python 3.x** | Linguagem principal e automação |
| **SQLite** | Banco de dados local leve |
| **openpyxl** | Geração do relatório Excel |
| **SQL** | Queries de pricing e lógica de negócio |

---

## Arquitetura

```
Schema SQL (schema.sql)
        ↓
Dados de Exemplo (seed.sql)
        ↓
Setup Python (setup_db.py) → autoprofit.db
        ↓
Queries SQL (margin / monthly_report / alerts)
        ↓
Gerador de Relatório (generate_report.py)
        ↓
Output Excel (autoprofit_report.xlsx)
```

---

## Funcionalidades

- ✅ Banco de dados SQLite relacional com 4 tabelas e 6 modelos de veículos
- ✅ 12 meses de dados simulados de preços e vendas
- ✅ Cálculo de margem bruta e líquida por modelo por mês
- ✅ Alertas de violação de limite de desconto
- ✅ Relatório Excel automatizado com 3 abas analíticas
- ✅ Queries SQL separadas por contexto de negócio
- ✅ Pipeline totalmente reproduzível — um script para configurar, um para reportar

---

## Como Rodar

### Pré-requisitos

- Python 3.x
- Git

### Passo a Passo

1. Clone o repositório:

```bash
git clone https://github.com/tiagosilva06/autoprofit
cd autoprofit
```

2. Instale as dependências:

```bash
pip install openpyxl
```

3. Configure o banco de dados:

```bash
python scripts/setup_db.py
```

4. Gere o relatório:

```bash
python scripts/generate_report.py
```

O relatório Excel será salvo em `output/autoprofit_report.xlsx`.

---

## Estrutura do Projeto

```
autoprofit/
├── data/
│   └── autoprofit.db
├── sql/
│   ├── schema.sql
│   ├── seed.sql
│   └── queries/
│       ├── margin.sql
│       ├── monthly_report.sql
│       └── alerts.sql
├── scripts/
│   ├── setup_db.py
│   └── generate_report.py
├── output/
│   └── autoprofit_report.xlsx
└── README.md
```

---

## Autor

**Tiago Silva**
[GitHub](https://github.com/tiagosilva06) • [LinkedIn](https://linkedin.com/in/tiago-silvadev)

---

> Construído com Python e SQL — focado no ecossistema de pricing e rentabilidade automotiva.