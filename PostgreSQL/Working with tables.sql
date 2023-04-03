SELECT p.id, p.price AS "Customer price", c.contract_price AS "Supplier price", p.price - c.contract_price AS "Customer price - Supplier price"
INTO prices
FROM purchases p 
INNER JOIN contracts c ON p.id = c.id;
				
SELECT supplier_inn, sum(is_winner) AS "Times won", count(is_winner) AS "Time participated"
INTO winners
FROM participants p 
GROUP BY supplier_inn;

SELECT c.contract_conclusion_date, p.publish_date, abs(c.contract_conclusion_date - p.publish_date) AS "Time delta"
INTO time_deltas
FROM contracts c 
INNER JOIN purchases p ON c.id = p.id
WHERE c.contract_conclusion_date IS NOT NULL AND p.publish_date IS NOT NULL 
ORDER BY (c.contract_conclusion_date - p.publish_date) DESC;

SELECT id, delivery_region
INTO regions
FROM purchases
GROUP BY delivery_region;

SELECT id, supplier_inn
INTO only_those_who_won
FROM participants p
WHERE p.is_winner = '1';

SELECT code, service_type, count(*)
INTO codes_counts
FROM fixed_margin fm
GROUP BY code, service_type;