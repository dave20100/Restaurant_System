﻿USE [GoodFoodMaster]
GO
INSERT INTO Location(Street, Number, City, PostCode) VALUES
('ul. Grunwaldzka', 67, 'Wroclaw', '50-415'),
('ul. Aleje Jerozolimskie', 33, 'Warszawa', '00-515'),
('ul. Ignacego Łukasiewicza', 18, 'Wrocław', '50-369');

Select * from Location

INSERT INTO Restaurant(Name, Description) VALUES
('WOO THAI Restaurant', 'Opis'),
('LEILA', 'Opis'),
('Pasibus', 'Opis');

Select * from Restaurant
INSERT INTO Menu(Description, ResteurantId) VALUES
('WOO THAI', 1),
('LEILA', 2),
('Pasibus', 3);

Select * from Menu

INSERT INTO Dish( Title, Description, Price, Kcal, Picture, MenuId) VALUES
('KEAW MOO', '(Wieprzowina, chili, prażony czosnek, kolendra)', 16, 232, 'https://woothai.pl/wp-content/uploads/2018/10/KEAW_KUNG_MOO-400.jpg', 1),
('TOD MUN KUNG HORAPA', '(Krewetki, długa zielona fasolka, tajska bazylia, domowe curry)', 22, 410, 'https://woothai.pl/wp-content/uploads/2018/10/TOD_MUN_KUNG_HORAPA-400.jpg', 1),
('KUAY TIAO PED', '(Kaczka, makaron ryżowy, pak choi, kiełki fasoli mung, chińska kapusta, szczypiorek, chili, prażony czosnek, kolendra)', 25, 336, 'https://woothai.pl/wp-content/uploads/2018/10/KUAI_TIAO_PED-400.jpg', 1),
('TOM KHA PED YANG', '(Kaczka, mleko kokosowe, grzyby słomiane, pomidorki koktajlowe, czerwona cebula, chili, tajska pietruszka, kolendra, olej chili)', 38, 555, 'https://woothai.pl/wp-content/uploads/2018/10/TOM_KHA_PED_YANG-400.jpg', 1),
('YAM PLA SAI MUN PAK PANG', '(Łosoś, Pak Pang, czerwona cebula, chili, czosnek, tajska bazylia, kolendra, limonka)', 30, 400, 'https://woothai.pl/wp-content/uploads/2018/10/YAM_PLA_SAI_MUN_PAK_PANG-400.jpg', 1),
('PAK PANG PAD KHAI', '(Pak Pang, jajko, imbir, czosnek)', 25, 167, 'https://woothai.pl/wp-content/uploads/2018/10/PAK_PANG_PAD_KHAI-400.jpg', 1),
('Shakshuka', 'Pomidor smażony z jajkiem oraz przyprawami', 17, 254, 'https://restauracjaleila.pl/wp-content/uploads/2019/10/img_0465.jpg', 2),
('ALOO PALAK', 'ziemniaki, szpinak, czosnek, kolendra', 13, 201, 'https://restauracjaleila.pl/wp-content/uploads/2019/10/img_0826.jpg', 2),
('SAŁATKA KEVA', '(buraczki, ogórek, pomidor, pietruszka, sok z cytryny, komosa)', 15, 315, 'https://restauracjaleila.pl/wp-content/uploads/2019/10/img_0382-1.jpg', 2),
('MUHAMMARA', 'Pasta z pieczonej papryki i orzechów włoskich', 13, 190, 'https://restauracjaleila.pl/wp-content/uploads/2019/10/img_0346.jpg', 2),
('BABA GANOUSH', '(bakłażan, mix papryk, pomidor, cebula, oliwa z oliwek, melasa z granata)', 15, 222, 'https://restauracjaleila.pl/wp-content/uploads/2019/10/img_0597.jpg', 2),
('BUTTER HALLOUMI', 'Grillowany ser halloumi w sosie pomidorowo-orzechowym', 19, 400, 'https://restauracjaleila.pl/wp-content/uploads/2019/10/img_0989-1.jpg', 2),
('STANDARD', '100% wołowiny, sos biały, sałata lodowa, ser cheddar, ogórek kiszony, pomidor, cebula', 21, 972, 'https://pasibus.blob.core.windows.net/media/2264/standard.jpg', 3),
('GONZALES', '100% wołowiny, sos różowy, rukola, pasta red curry, ser cheddar, jalapeño, nachosy', 26, 1068, 'https://pasibus.blob.core.windows.net/media/2252/gonzales.jpg', 3),
('PESTARDO', '100% wołowiny, sos biały, roszponka, pesto z suszonych pomidorów i rukoli, grillowana mozzarella, pomidor', 26, 1100, 'https://pasibus.blob.core.windows.net/media/2262/pestardo.jpg', 3),
('KURA CLASSICO', 'kurczak w autorskiej panierce, autorski sos, sałata lodowa, pomidor, czerwona cebula', 23, 917, 'https://pasibus.blob.core.windows.net/media/2269/kura-classico.jpg', 3);
--(17, '', '', , , null, 3),



Select * from Dish


--INSERT INTO Discount(Id, Description, Value, ResteurantId) VALUES
--(1, 'EQWEQE', 1231, 12);

Select * from Discount
--delete from Dish where 1=1
--delete from Menu where 1=1
--delete from Discount where 1=1
--delete from Restaurant where 1=1
--delete from Location where 1=1
GO