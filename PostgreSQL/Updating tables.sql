UPDATE purchases
SET lot_name = NULL
WHERE lot_name = '';

UPDATE participants
SET is_winner = CASE is_winner 
					WHEN 'Нет' THEN 0
				ELSE 1
				END;

UPDATE contracts 
SET contract_reg_number = NULL 
WHERE contract_reg_number = '';

UPDATE contracts 
SET contract_conclusion_date = NULL 
WHERE contract_conclusion_date = '1970-01-01';

UPDATE purchases
SET delivery_region = CASE  
					      WHEN delivery_region IN ('Ратта', 'Красноселькуп', 'Пуровский', 'Салехард', 'Губкинский', 'Надымский', 
					      'Катравож', 'Муравленко', 'Ненецкий', 'Шурышкарский', 'Тазовский', 'Новый Уренгой', 'Нарьян-Мар', 
					      'Газ-Сале', 'Лабытнанги', 'Аскарка', 'Халясавэй', 'Ноябрьск') THEN 'Ямало-Ненецкая'
					      WHEN delivery_region IN ('Пола', 'Валдайский', 'Чудовский', 'Старорусский', 'Парфинский', 'Батецкий',
					      'Окуловский', 'Солецкий', 'Мошенской', 'Пестовский', 'Боровичский', 'Маловишерский', 'Поддорский',
					      'Любытинский', 'Крестецкий', 'Хвойнинский', 'Великий Новгород', 'Холмский', 'Демянский') THEN 'Новгородский'
					      WHEN delivery_region IN ('Плюсса', 'Орда', 'Горнозаводск', 'Псков') THEN 'Псковская'
					      WHEN delivery_region IN ('Гулькевичи', 'Тимашевск', 'Новороссийск', 'Мостовской') THEN 'Краснодарский'
					      WHEN delivery_region IN ('Юрга', 'Киселевск', 'Полысаево', 'Новокузнецк', 'Прокопьевск', 'Мариинск',
					      'Большой Керлегеш', 'Кемеровская область - Кузбасс') THEN 'Кемеровская'
					      WHEN delivery_region IN ('Сургут', 'Ханты-Мансийский АО - Югра') THEN 'Ханты-Мансийская'
					      WHEN delivery_region IN ('Кинешма') THEN 'Ивановская'
					      WHEN delivery_region IN ('Маревский') THEN 'Нижегородская'
					      WHEN delivery_region IN ('Подольск', 'Яхрома', 'Белоозерский', 'Москва', 'Московская') THEN 'Московская'
					      WHEN delivery_region IN ('Шимский', 'Междуреченск') THEN 'Челябинская'
					      WHEN delivery_region IN ('Березники', 'Соликамск', 'Кунгур', 'Пермь') THEN 'Пермская'
					      WHEN delivery_region IN ('Ямальский') THEN 'Тюменская'
					      ELSE delivery_region
					  END;
					 
ALTER TABLE public.winners ALTER COLUMN "Times won" TYPE float4 USING "Times won"::float4;
ALTER TABLE public.winners ALTER COLUMN "Time participated" TYPE float4 USING "Time participated"::float4;
ALTER TABLE public.winners ADD COLUMN "Win rate %" REAL;

UPDATE winners 
SET "Win rate %" = ("Times won" / "Time participated") * 100;