--Krijoni 4 tabela. Tabelat te lidhen me nj-tj me foregin key. (Te pakten 1 lidhje shume me shume me tabelat)
CREATE TABLE kategoria (
    id SERIAL PRIMARY KEY,
    lloji_librit VARCHAR(50)
);


INSERT INTO kategoria (lloji_librit) VALUES
('Shkencor'),
('Letërsi'),
('Teknik'),
('Fëmijë'),
('Histori');


CREATE TABLE libri(
id serial PRIMARY KEY,
titulli VARCHAR(50),
cmimi INT,
autori VARCHAR(50,
kategoria_id INT REFERENCES kategoria(id)
);


 INSERT INTO libri (titulli, cmimi, autori, kategoria_id) VALUES
('Fizika për Fillestarë', 1200, 'Drini Pano', 1),
('Dashuri në Kohën e Kolerës', 1000, 'Gabriel Garcia Marquez', 2),
('Java Programming', 1500, 'James Gosling', 3),
('Përralla për Fëmijë', 800, 'Hans Christian Andersen', 4),
('Histori e Shqipërisë', 1300, 'Marenglen Verli', 5),
('Algoritmet', 1600, 'Thomas Cormen', 3),
('Matematika Moderne', 1400, 'Linda Lushnja', 1),
('Shqiponjat e Malësisë', 1100, 'Anton Harapi', 5),
('ABC për Fëmijë', 700, 'Enkelejda Doka', 4);


CREATE TABLE studenti(
id serial PRIMARY KEY,
emri VARCHAR(50),
mbiemri VARCHAR(50),
email VARCHAR(50)
);

INSERT INTO studenti (emri, mbiemri, email) VALUES
('Morena', 'Bardhi', 'morena@example.com'),
('Mirsalda', 'Ylli', 'mila@example.com'),
('Gerald', 'Lita', 'gerii@example.com'),
('Rebeka', 'Krasniqi', 'rebeka@example.com'),
('Leon', 'Meta', 'leon@example.com');


CREATE TABLE marrje_libri(
id SERIAL PRIMARY KEY,
libri_id INT REFERENCES libri(id),
studenti_id INT REFERENCES studenti(id),
data_marrjes DATE DEFAULT CURRENT_DATE
);

INSERT INTO marrje_libri (libri_id, studenti_id, data_marrjes) VALUES
(1, 1, '2025-05-01'),
(2, 1, '2025-05-03'),
(3, 2, '2025-05-02'),
(4, 3, '2025-05-01'),
(5, 3, '2025-05-05'),
(6, 4, '2025-05-04'),
(7, 5, '2025-05-03'),
(8, 2, '2025-05-06'),
(9, 1, '2025-05-07'),
(3, 5, '2025-05-08'),
(6, 2, '2025-05-09');

--4 taelat qe krijuam
SELECT * FROM studenti;
SELECT * FROM marrje_libri;
SELECT * FROM kategoria;
SELECT * FROM libri;

--Numri total i librave të marrë nga çdo student
SELECT s.emri, s.mbiemri, COUNT(ml.id) AS numri_librave
FROM studenti s
JOIN marrje_libri ml ON s.id = ml.studenti_id
GROUP BY s.id
ORDER BY numri_librave DESC;

--Çmimi mesatar i librave sipas kategorive
SELECT k.lloji_librit, AVG(l.cmimi) AS cmimi_mesatar
FROM kategoria k
JOIN libri l ON k.id = l.kategoria_id
GROUP BY k.id
ORDER BY cmimi_mesatar DESC;

--Shuma totale e çmimeve të librave të marrë nga çdo student
SELECT s.emri, s.mbiemri, SUM(l.cmimi) AS shuma_cmimit
FROM studenti s
JOIN marrje_libri ml ON s.id = ml.studenti_id
JOIN libri l ON ml.libri_id = l.id
GROUP BY s.id
ORDER BY shuma_cmimit DESC;

--Numri i studentëve që kanë marrë të paktën 1 libër 
SELECT COUNT(DISTINCT studenti_id) AS nr_studentesh
FROM marrje_libri;









