-- Monthly performance report per model

SELECT
    m.model_name,
    m.brand,
    m.segment,
    s.month_ref,
    s.units,
    s.total_revenue,
    s.avg_discount,
    p.dealer_price,
    p.factory_cost,
    (p.dealer_price - p.factory_cost) AS unit_margin,
    ((p.dealer_price - p.factory_cost) * s.units) AS total_margin,
    COALESCE(SUM(i.value), 0) AS total_incentives,
    ((p.dealer_price - p.factory_cost) * s.units) - COALESCE(SUM(i.value), 0) AS net_margin
FROM sales s
JOIN models m ON m.id = s.model_id
JOIN prices p ON p.model_id = s.model_id AND p.month_ref = s.month_ref
LEFT JOIN incentives i ON i.model_id = s.model_id AND i.month_ref = s.month_ref
GROUP BY m.model_name, s.month_ref
ORDER BY s.month_ref, net_margin DESC;