-- Gross margin per model per month

SELECT
    m.model_name,
    m.brand,
    p.month_ref,
    p.list_price,
    p.dealer_price,
    p.factory_cost,
    (p.dealer_price - p.factory_cost) AS gross_margin,
    ROUND((p.dealer_price - p.factory_cost) * 100.0 / p.list_price, 2) AS margin_pct
FROM prices p
JOIN models m ON m.id = p.model_id
ORDER BY p.month_ref, margin_pct DESC;