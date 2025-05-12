--Krijoni nje tabele me emrin kursi me fusha: id, emri kursit, kohezgjatja, create date, update date. 
CREATE TABLE kursi (
id serial PRIMARY KEY ,
emri_kursit VARCHAR(100) ,
kohezgjatja int , 
create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--Mbusheni tabelen me 10 te dhena
INSERT INTO kursi (emri_kursit, kohezgjatja) VALUES
('Java', 30),
('Angular', 45),
('.Net', 50),
('Web', 35),
('C/C++', 50),
('Cloud Computing', 60),
('Cybersecurity', 30),
('Digital Marketing', 25),
('Artificial Intelligence', 40),
('Operating System', 35);


--Modifikoni strukturen e tabeles shtoni fushen programming language 
ALTER TABLE kursi
ADD COLUMN programming_language VARCHAR(50); 


--Beni update te dhenat ekzisutese dhe plotesoni fushen e re
UPDATE kursi 
SET programming_language ='.Net'
WHERE id = 1 ; 
UPDATE kursi 
SET programming_language ='Java'
WHERE id = 5 ;


--Fshini nje nga kurset
DELETE FROM kursi WHERE id = 8; 


--Shtoni nje tabele student m fushat: id, emri, email, birth date, phone number, pike dhe 
foreign key id e tabeles internship
CREATE TABLE student (
id serial PRIMARY KEY , 
emri VARCHAR(50),
email VARCHAR(50), 
birth_date TIMESTAMP, 
phone_number VARCHAR(20), 
pike int, 
student_key int , 
FOREIGN KEY (student_key) REFERENCES kursi (id)
);

--Mbusheni tabelen me te dhena
INSERT INTO student (emri , email , birth_date , phone_number , pike  , student_key) VALUES 
('Morena' , 'morena@gmail.com' , '2003-10-18' , '0681111111' , 10 , 1 ) , 
('Denada', 'denada@example.com', '2002-07-15', '0682222222', 15, 3),
    ('Sara', 'sara@example.com', '2000-06-18', '0683333333', 20, 4),
    ('Anxhela', 'anxhela@example.com', '1999-11-02', '0684444444', 25, 5),
    ('Rina', 'rina@example.com', '2003-09-11', '0685555555', 30, 5),
    ('Era', 'era@example.com', '2001-01-22', '0686666666', 35, 7),
    ('Suela', 'suela@example.com', '2000-10-29', '0687777777', 40, 2),
    ('Eva', 'eva@example.com', '1999-12-10', '0688888888', 45, 4),
	  ('Armela', 'armela@example.com', '1999-12-10', '0689999999', 45, 4),
    ('Lorena', 'lorenan@example.com', '2002-05-16', '0680000000', 50, 3);


 --Riemertoni nje nga kolonat
ALTER TABLE student 
RENAME COLUMN  emri to name;   


--Listoni te gjithe kurset
SELECT * FROM student; 


--Listoni te gjithe studentet qe emri iu fillon me A 
SELECT * FROM student
WHERE emri LIKE 'A%'


--Listoni kurset qe kane ndodhur mes vitit 2023- 2025.
SELECT * FROM kursi
WHERE create_date BETWEEN '2023-01-01' AND '2025-12-31';


// Listoni studentet qe jane me te medhenj se 25 vjec
SELECT emri , EXTRACT(YEAR FROM AGE(birth_date)) AS mosha
FROM student
WHERE EXTRACT(YEAR FROM AGE(birth_date)) > 15;
