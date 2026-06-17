-- Discount limit alerts

SELECT
    m.model_name,
    m.brand,
    s.month_ref,
    s.avg_discount,
    p.max_discount,
    (s.avg_discount - p.max_discount) AS discount_excess
FROM sales s
JOIN models m ON m.id = s.model_id
JOIN prices p ON p.model_id = s.model_id AND p.month_ref = s.month_ref
WHERE s.avg_discount > p.max_discount
ORDER BY discount_excess DESC;