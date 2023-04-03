SELECT p.*, p2.supplier_inn, p2.is_winner, c.contract_reg_number, c.contract_price, c.contract_conclusion_date
INTO purchases_participants_contracts
FROM purchases p
INNER JOIN participants p2 ON p.id = p2.id
INNER JOIN contracts c ON p.id = c.id;

SELECT otww.id, w.*
INTO id_winners
FROM only_those_who_won otww 
INNER JOIN winners w ON otww.supplier_inn = w.supplier_inn;

SELECT fm.*, iw.supplier_inn, iw."Times won", iw."Win rate %" 
INTO fixed_margin_and_winners
FROM fixed_margin fm
LEFT JOIN id_winners iw ON fm.id = iw.id;

SELECT fmaw.*, cc.count 
INTO fixed_margin_and_winners_and_codes
FROM fixed_margin_and_winners fmaw 
LEFT JOIN codes_counts cc ON fmaw.code = cc.code;