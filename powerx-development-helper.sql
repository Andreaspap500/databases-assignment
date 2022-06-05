-- The users table, in order to login
CREATE TABLE `users` (
  `id` int(11) NOT NULL PRIMARY KEY,
  `loginid` varchar(250) NOT NULL,
  `password` text NOT NULL
);

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (`id`, `loginid`, `password`)
VALUES
  (1, 'admin', 'admin');

-- The organizations table
CREATE TABLE `organizations` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `abbreviation` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
);

INSERT INTO
  organizations (
    `abbreviation`,
    `name`,
    `zip_code`,
    `city`,
    `street`
  )
VALUES
  (
    'NTUA',
    'National Technical University of Athens',
    '15875',
    'Athens',
    'Kokkinopoulou 40'
  ),
  (
    'EKPA',
    'Panepistimio Athinwn',
    '16859',
    'Athens',
    'Solonos 8'
  ),
  (
    'DPΟΤΗ',
    'Dimokriteio',
    '14750',
    'Alexandroupoli',
    'Akadimias 15'
  ),
  (
    'APTH',
    'Ereunitiko Kentro Aristoteliou Panepistimiou Thessalonikis',
    '18615',
    'Athens',
    'Tsimiski 56'
  ),
  (
    'AKTOR',
    'Aktor-constructions',
    '19556',
    'Athens',
    'Kifisias 156'
  ),
  (
    'MTLN',
    'Mytilinaios',
    '17456',
    'Athens',
    'Kifisias 188'
  ),
  (
    'TERNA',
    'GEK-TERNA',
    '18496',
    'Athens',
    'Ardittou 57'
  ),
  (
    'ABAX',
    'ABAX-constructions',
    '12496',
    'Athens',
    'Kifisias 36'
  ),
  (
    'EK',
    'Ellinika-Kalodia',
    '19572',
    'Athens',
    'Leoforos Aspropirgou 45'
  ),
  (
    'TITAN',
    'TITAN Cement',
    '19579',
    'Athens',
    'Leoforos Aspropirgou 79'
  ),
  (
    'MO',
    'Motor Oil',
    '18260',
    'Athens',
    'Leoforos Aspropirgou 92'
  ),
  (
    'BP',
    'BP',
    '18263',
    'Athens',
    'Leoforos Nato 99'
  ),
  (
    'Shell',
    'Shell',
    '18265',
    'Athens',
    'Leoforos Nato 65'
  ),
  (
    'Hraklis',
    'AGET-Hraklis',
    '17346',
    'Athens',
    'Thivon 95'
  ),
  (
    'SNDR',
    'SIDENOR',
    '17457',
    'Athens',
    'Peiraios 18'
  );

-- The organization_phones table
CREATE TABLE `organization_phones` (
  `organization_id` bigint unsigned NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

INSERT INTO
  organization_phones (organization_id, phone_number)
VALUES
  (1, '+30698483794'),
  (1, '+30210473947'),
  (2, '+4438492749');

-- The research_centers table
CREATE TABLE `research_centers` (
  `organization_id` bigint unsigned NOT NULL PRIMARY KEY,
  `ministry_of_education_budget` decimal(20, 2) unsigned NOT NULL,
  `private_funding_budget` decimal(20, 2) unsigned NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

INSERT INTO
  research_centers(
    organization_id,
    ministry_of_education_budget,
    private_funding_budget
  )
VALUES
  (3, 5000000.80, 140000000.10),
  (4, 889200.44, 28900000.24);

-- The universities table
CREATE TABLE `universities` (
  `organization_id` bigint unsigned NOT NULL PRIMARY KEY,
  `ministry_of_education_budget` decimal(20, 2) unsigned NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

INSERT INTO
  universities(
    organization_id,
    ministry_of_education_budget
  )
VALUES
  (1, 70000000.80),
  (2, 8892800.44);

-- The companies table
CREATE TABLE `companies` (
  `organization_id` bigint unsigned NOT NULL PRIMARY KEY,
  `idia_kefalaia` decimal(20, 2) unsigned NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

INSERT INTO
  companies(organization_id, idia_kefalaia)
VALUES
  (5, 140000000.10),
  (6, 28900007800.24),
  (7, 8900007800.24),
  (8, 200007800.24),
  (9, 2900007800.24),
  (10, 200007800.24),
  (11, 2890007800.24),
  (12, 180007800.24),
  (13, 38900007800.24),
  (14, 88900007800.24),
  (15, 98900007800.24);

-- The scientific_fields table
CREATE TABLE `scientific_fields` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

INSERT INTO
  `scientific_fields` (`name`)
VALUES
  ('Mechanical Engineering'),
  ('Naval Engineering'),
  ('Civil Engineering'),
  ('Chemical Engineering'),
  ('Electrical Engineering'),
  ('Computer Science'),
  ('Oceanography');

-- The programmata table
CREATE TABLE `programs` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
);

INSERT INTO
  programs (`name`, `address`)
VALUES
  ('Hercules I', 'Kokkinopoulou 2'),
  ('Clean Energy I', 'Peiraios 14'),
  ('Medditeranean Cleaner', 'Voulis 8'),
  ('Recycling Actions II', 'Stadiou 10'),
  ('Concrete Development I', 'Kifisias 15'),
  (
    'Cable Material Development I',
    'Panepistimiou 78'
  ),
  (
    'Cable Material Development II',
    'Panepistimiou 78'
  ),
  (
    'Cable Material Development III',
    'Panepistimiou 78'
  ),
  (
    'Cable Material Development IV',
    'Panepistimiou 78'
  ),
  (
    'Cable Material Development V',
    'Panepistimiou 78'
  ),
  (
    'Cable Material Development VI',
    'Panepistimiou 78'
  ),
  ('Alternative Energy Resources', 'Stadiou 17'),
  ('Concrete Development II', 'Kifisias 15'),
  ('Concrete Development III', 'Kifisias 15'),
  ('Concrete Development IV', 'Kifisias 15'),
  ('Concrete Development V', 'Kifisias 15'),
  ('Concrete Development VI', 'Kifisias 15'),
  ('Concrete Development VII', 'Kifisias 15'),
  ('Concrete Development VIII', 'Kifisias 15'),
  ('Concrete Development IX', 'Kifisias 15'),
  ('Concrete Development X', 'Kifisias 15'),
  ('Recycling Actions I', 'Stadiou 10'),
  ('Recycling Actions III', 'Stadiou 10'),
  ('Hercules II', 'Kokkinopoulou 2'),
  ('Hercules III', 'Kokkinopoulou 2'),
  ('Hercules IV', 'Kokkinopoulou 2'),
  ('Hercules V', 'Kokkinopoulou 2'),
  ('Hercules VI', 'Kokkinopoulou 2'),
  (
    'Program Athens Waste Management 15',
    'Kokkinopoulou 2'
  ),
  (
    'Program Athens Waste Management 16',
    'Kokkinopoulou 3'
  ),
  (
    'Program Athens Waste Management 17',
    'Kokkinopoulou 2'
  ),
  (
    'Program Athens Waste Management 18',
    'Kokkinopoulou 3'
  ),
  (
    'Program Athens Waste Management 19',
    'Kokkinopoulou 2'
  ),
  (
    'Program Athens Waste Management 20',
    'Kokkinopoulou 3'
  ),
  (
    'Program Athens Waste Management 21',
    'Kokkinopoulou 2'
  ),
  (
    'Program Athens Waste Management 22',
    'Kokkinopoulou 3'
  ),
  ('Program Renewable Energy 04', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 05', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 06', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 07', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 08', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 09', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 10', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 11', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 12', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 13', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 14', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 15', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 16', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 17', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 18', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 19', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 20', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 21', 'Kokkinopoulou 2'),
  ('Program Renewable Energy 22', 'Kokkinopoulou 3'),
  ('Program Renewable Energy 23', 'Kokkinopoulou 2'),
  ('Program Wind Energy 19', 'Kokkinopoulou 3'),
  ('Program Wind Energy 20', 'Kokkinopoulou 2'),
  ('Program Wind Energy 21', 'Kokkinopoulou 3'),
  ('Program Solar Energy 19', 'Kokkinopoulou 2'),
  ('Program Solar Energy 20', 'Kokkinopoulou 3'),
  ('Program Solar Energy 21', 'Kokkinopoulou 2'),
  ('Program Thermal Energy 19', 'Kokkinopoulou 2'),
  ('Program Thermal Energy 20', 'Kokkinopoulou 3'),
  ('Program Thermal Energy 21', 'Kokkinopoulou 2'),
  (
    'Program New Database System 19',
    'Kokkinopoulou 3'
  ),
  (
    'Program New Database System 20',
    'Kokkinopoulou 2'
  ),
  (
    'Program New Database System 21',
    'Kokkinopoulou 3'
  ),
  (
    'Program New Supercomputer 19',
    'Kokkinopoulou 2'
  ),
  (
    'Program New Supercomputer 20',
    'Kokkinopoulou 3'
  ),
  (
    'Program New Supercomputer 21',
    'Kokkinopoulou 2'
  ),
  (
    'Program 5G Telecommunications 19',
    'Kokkinopoulou 3'
  ),
  (
    'Program 5G Telecommunications 20',
    'Kokkinopoulou 2'
  ),
  (
    'Program 5G Telecommunications 21',
    'Kokkinopoulou 3'
  ),
  ('Program Cement Research 19', 'Kokkinopoulou 2'),
  ('Program Cement Research 20', 'Kokkinopoulou 3'),
  ('Program Cement Research 21', 'Kokkinopoulou 2'),
  ('Program Nanomaterials 19', 'Kokkinopoulou 3'),
  ('Program Nanomaterials 20', 'Kokkinopoulou 2'),
  ('Program Nanomaterials 21', 'Kokkinopoulou 2'),
  ('Program Nanomaterials 22', 'Kokkinopoulou 3'),
  (
    'Program Networks of the future 19',
    'Kokkinopoulou 2'
  ),
  (
    'Program Networks of the future 20',
    'Kokkinopoulou 3'
  ),
  (
    'Program Networks of the future 21',
    'Kokkinopoulou 2'
  ),
  (
    'Program Networks of the future 22',
    'Kokkinopoulou 3'
  ),
  ('Program ', 'Networks of the future 22');

-- The executives table
CREATE TABLE `executives` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

INSERT INTO
  `executives` (`name`)
VALUES
  ('John Anastasiou'),
  ('Nick Alexiou'),
  ('George Ioannou'),
  ('Anastasia Georgiou'),
  ('Alexandra Kaniou'),
  ('Panagiotis Nikolaou'),
  ('Ioannis Politikos'),
  ('Myrtw Glytsi'),
  ('Marios Theodorou'),
  ('Konstantina Kimoulaki'),
  ('Marianna Kerantzaki'),
  ('Xrisiida Tsioptsis'),
  ('Konstantina Stefanou'),
  ('Anastasios Charpantidis'),
  ('Themis Chasiotis'),
  ('George Tirellis'),
  ('Athina Nikolaou');

-- The researchers table
CREATE TABLE `researchers` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `sex` varchar(255) NOT NULL,
  `date_of_employment` varchar(255) NOT NULL,
  `organization_id` bigint unsigned NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

INSERT INTO
  researchers (
    first_name,
    last_name,
    date_of_birth,
    sex,
    date_of_employment,
    organization_id
  )
VALUES
  (
    'Andreas',
    'Papanikolaou',
    '1990-01-19',
    'male',
    '2014-05-05',
    1
  ),
  (
    'Panos',
    'Kamateros',
    '1985-01-20',
    'male',
    '2013-06-09',
    1
  ),
  (
    'Vasiliki',
    'Karanikou',
    '1986-01-21',
    'female',
    '2012-07-09',
    1
  ),
  (
    'Konstantinos',
    'Markou',
    '1992-01-29',
    'male',
    '2014-09-05',
    4
  ),
  (
    'Anastasios',
    'Papakostas',
    '1992-01-29',
    'male',
    '2014-09-05',
    4
  ),
  (
    'Nikos',
    'Papatheodorou',
    '1975-03-26',
    'male',
    '2015-09-05',
    5
  ),
  (
    'George',
    'Fountoukis',
    '1957-03-26',
    'male',
    '2000-10-03',
    5
  ),
  (
    'Anastasios',
    'Karidis',
    '1967-04-15',
    'male',
    '2007-05-04',
    5
  ),
  (
    'Nikos',
    'Gewrgalas',
    '1973-03-26',
    'male',
    '2009-05-02',
    5
  ),
  (
    'Anastasia',
    'Papanikolaou',
    '1983-07-18',
    'female',
    '2014-12-08',
    6
  ),
  (
    'Maria',
    'Ailamaki',
    '1984-08-28',
    'female',
    '2015-11-07',
    6
  ),
  (
    'Georgia',
    'Psarianou',
    '1989-11-28',
    'female',
    '2018-12-07',
    6
  ),
  (
    'Maria',
    'Mixaliatsianou',
    '1996-05-22',
    'female',
    '2016-11-07',
    7
  ),
  (
    'John',
    'Mixalopoulos',
    '1993-07-23',
    'male',
    '2017-11-08',
    7
  ),
  (
    'Mixalis',
    'Georgakoglou',
    '1992-10-06',
    'male',
    '2017-05-08',
    7
  ),
  (
    'Nick',
    'Sinodinos',
    '1997-07-23',
    'male',
    '2017-06-02',
    8
  ),
  (
    'Georgia',
    'Katsantoni',
    '1993-07-23',
    'female',
    '2017-07-08',
    8
  ),
  (
    'Marios',
    'Paksinos',
    '1991-07-23',
    'male',
    '2015-08-06',
    8
  ),
  (
    'Antonis',
    'Kapsis',
    '1996-07-23',
    'male',
    '2019-09-03',
    9
  ),
  (
    'Vasilis',
    'Torosidis',
    '1993-07-23',
    'male',
    '2017-14-05',
    9
  ),
  (
    'Ioannis',
    'Pesmoulakis',
    '1993-07-23',
    'male',
    '2017-01-07',
    9
  ),
  (
    'Nick',
    'Giannou',
    '1991-07-24',
    'male',
    '2016-01-02',
    10
  ),
  (
    'Georgia',
    'Mitsaina',
    '1993-07-23',
    'female',
    '2017-03-06',
    10
  ),
  (
    'Vaggelis',
    'Saroglou',
    '1997-07-23',
    'male',
    '2018-04-03',
    10
  ),
  (
    'Stefania',
    'Drakou',
    '1985-07-23',
    'female',
    '2017-09-08',
    11
  ),
  (
    'Nikoletta',
    'Stefou',
    '1993-07-23',
    'female',
    '2017-10-08',
    11
  ),
  (
    'Kostas',
    'Hatzoglou',
    '1988-06-25',
    'male',
    '2018-11-08',
    11
  ),
  (
    'Maria',
    'Kamaterou',
    '1999-07-23',
    'female',
    '2021-12-19',
    12
  ),
  (
    'Stelios',
    'Legakis',
    '1993-07-23',
    'male',
    '2020-05-18',
    12
  ),
  (
    'George',
    'Giannias',
    '1993-07-23',
    'male',
    '2021-01-08',
    12
  ),
  (
    'Afroditi',
    'Skoura',
    '1965-07-23',
    'female',
    '2010-12-19',
    13
  ),
  (
    'Anestis',
    'Gkiourtzidis',
    '1997-07-23',
    'male',
    '2019-05-18',
    13
  ),
  (
    'Marios',
    'Sirapoglou',
    '1996-07-23',
    'male',
    '2014-01-08',
    13
  ),
  (
    'Afroditi',
    'Begolaki',
    '1960-07-23',
    'female',
    '2010-12-19',
    13
  ),
  (
    'Giannis',
    'Renakis',
    '1997-07-23',
    'male',
    '2021-05-18',
    13
  ),
  (
    'Mixalis',
    'Katzourakis',
    '1998-07-23',
    'male',
    '2019-01-08',
    13
  ),
  (
    'Alexandra',
    'Skoura',
    '1972-07-23',
    'female',
    '2003-12-19',
    14
  ),
  (
    'Giorgos',
    'Papadopoulos',
    '1990-07-23',
    'male',
    '2011-05-18',
    14
  ),
  (
    'Andreas',
    'Stathopoulos',
    '1990-07-23',
    'male',
    '2015-01-08',
    14
  );

-- The projects table
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date,
  `budget` decimal(20, 2) unsigned,
  `managing_organization_id` bigint unsigned NOT NULL,
  `program_id` bigint unsigned NOT NULL,
  `executive_id` bigint unsigned NOT NULL,
  `scientific_director_researcher_id` bigint unsigned NOT NULL,
  FOREIGN KEY (managing_organization_id) REFERENCES organizations(id),
  FOREIGN KEY (program_id) REFERENCES programs(id),
  FOREIGN KEY (executive_id) REFERENCES executives(id),
  FOREIGN KEY (scientific_director_researcher_id) REFERENCES researchers(id)
);

INSERT INTO
  `projects` (
    `title`,
    `description`,
    `start_date`,
    `end_date`,
    `budget`,
    managing_organization_id,
    program_id,
    executive_id,
    scientific_director_researcher_id
  )
VALUES
  (
    'Clean Sea 16',
    'Cleaning The Mediteranean using new technologies',
    '2016-01-05',
    '2017-01-05',
    '1255000.88',
    '1',
    '1',
    '1',
    '1'
  ),
  (
    'Clean Sea 17',
    'Cleaning The Mediteranean using new technologies',
    '2017-01-05',
    '2018-01-05',
    '1255000.88',
    '2',
    '2',
    '2',
    '2'
  ),
  (
    'Clean Sea 18',
    'Cleaning The Mediteranean using new technologies',
    '2018-01-05',
    '2022-02-06',
    '1255000.88',
    '3',
    '3',
    '3',
    '3'
  ),
  (
    'Clean Sea 19',
    'Cleaning The Mediteranean using new technologies',
    '2019-01-05',
    '2022-02-06',
    '1255000.88',
    '4',
    '4',
    '4',
    '4'
  ),
  (
    'Clean Sea 21',
    'Cleaning The Mediteranean using new technologies',
    '2021-01-05',
    '2025-02-06',
    '1255000.88',
    '5',
    '5',
    '5',
    '5'
  ),
  (
    'Clean Sea 22',
    'Cleaning The Mediteranean using new technologies',
    '2022-01-05',
    '2025-02-06',
    '1255000.88',
    '6',
    '6',
    '6',
    '6'
  ),
  (
    'Athens Waste Management 15',
    'Recycling Materials in new facilities',
    '2015-03-03',
    '2019-04-04',
    '3500000.49',
    '7',
    '7',
    '7',
    '7'
  ),
  (
    'Advanced Concrete',
    'Creating new technology',
    '2015-01-05',
    '2020-01-04',
    '125550.88',
    '8',
    '8',
    '8',
    '8'
  ),
  (
    'Athens Waste Management 15',
    'Recycling Materials in new facilities',
    '2015-03-03',
    '2019-04-04',
    '3500000.49',
    '1',
    '7',
    '7',
    '1'
  ),
  (
    'Athens Waste Management 16',
    'Recycling Materials in new facilities',
    '2016-03-03',
    '2021-03-02',
    '3500000.49',
    '2',
    '8',
    '7',
    '2'
  ),
  (
    'Athens Waste Management 17',
    'Recycling Materials in new facilities',
    '2017-03-03',
    '2022-03-02',
    '3500000.49',
    '1',
    '9',
    '7',
    '1'
  ),
  (
    'Athens Waste Management 18',
    'Recycling Materials in new facilities',
    '2018-03-03',
    '2023-03-02',
    '3500000.49',
    '2',
    '10',
    '7',
    '2'
  ),
  (
    'Athens Waste Management 19',
    'Recycling Materials in new facilities',
    '2019-03-03',
    '2024-03-01',
    '3500000.49',
    '7',
    '11',
    '8',
    '1'
  ),
  (
    'Athens Waste Management 20',
    'Recycling Materials in new facilities',
    '2020-03-03',
    '2025-03-02',
    '3500000.49',
    '7',
    '12',
    '8',
    '2'
  ),
  (
    'Athens Waste Management 21',
    'Recycling Materials in new facilities',
    '2021-03-03',
    '2026-03-02',
    '3500000.49',
    '7',
    '13',
    '8',
    '1'
  ),
  (
    'Athens Waste Management 22',
    'Recycling Materials in new facilities',
    '2022-03-03',
    '2027-03-02',
    '3500000.49',
    '7',
    '14',
    '8',
    '2'
  ),
  (
    'Renewable Energy 04',
    'Loans',
    '2004-01-01',
    '2008-12-30',
    '7382748.44',
    '1',
    '15',
    '9',
    '1'
  ),
  (
    'Renewable Energy 05',
    'Loans',
    '2005-01-01',
    '2009-12-31',
    '7482748.44',
    '1',
    '16',
    '9',
    '2'
  ),
  (
    'Renewable Energy 06',
    'Loans',
    '2006-01-01',
    '2010-12-31',
    '7582748.44',
    '1',
    '17',
    '9',
    '1'
  ),
  (
    'Renewable Energy 07',
    'Loans',
    '2007-01-01',
    '2011-12-31',
    '7682748.44',
    '1',
    '18',
    '10',
    '2'
  ),
  (
    'Renewable Energy 08',
    'Loans',
    '2008-01-01',
    '2012-12-30',
    '7782748.44',
    '1',
    '19',
    '4',
    '1'
  ),
  (
    'Renewable Energy 09',
    'Loans',
    '2009-01-01',
    '2013-12-31',
    '7882748.44',
    '1',
    '20',
    '4',
    '2'
  ),
  (
    'Renewable Energy 10',
    'Loans',
    '2010-01-01',
    '2014-12-31',
    '7982748.44',
    '1',
    '21',
    '4',
    '1'
  ),
  (
    'Renewable Energy 11',
    'Loans',
    '2011-01-01',
    '2015-12-31',
    '8082748.44',
    '8',
    '22',
    '4',
    '2'
  ),
  (
    'Renewable Energy 12',
    'Loans',
    '2012-01-01',
    '2016-12-30',
    '8182748.44',
    '8',
    '23',
    '4',
    '1'
  ),
  (
    'Renewable Energy 13',
    'Loans',
    '2013-01-01',
    '2017-12-31',
    '8282748.44',
    '8',
    '24',
    '2',
    '2'
  ),
  (
    'Renewable Energy 14',
    'Loans',
    '2014-01-01',
    '2018-12-31',
    '8382748.44',
    '8',
    '25',
    '2',
    '1'
  ),
  (
    'Renewable Energy 15',
    'Loans',
    '2015-01-01',
    '2019-12-31',
    '8482748.44',
    '8',
    '26',
    '2',
    '2'
  ),
  (
    'Renewable Energy 16',
    'Loans',
    '2016-01-01',
    '2020-12-30',
    '8582748.44',
    '8',
    '27',
    '1',
    '1'
  ),
  (
    'Renewable Energy 17',
    'Loans',
    '2017-01-01',
    '2021-12-31',
    '8682748.44',
    '7',
    '28',
    '9',
    '2'
  ),
  (
    'Renewable Energy 18',
    'Loans',
    '2018-01-01',
    '2022-12-31',
    '8782748.44',
    '7',
    '29',
    '9',
    '1'
  ),
  (
    'Renewable Energy 19',
    'Loans',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '30',
    '9',
    '2'
  ),
  (
    'Renewable Energy 20',
    'Loans',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '31',
    '9',
    '1'
  ),
  (
    'Renewable Energy 21',
    'Loans',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '32',
    '9',
    '2'
  ),
  (
    'Renewable Energy 22',
    'Loans',
    '2022-01-01',
    '2026-12-31',
    '9182748.44',
    '7',
    '33',
    '9',
    '1'
  ),
  (
    'Renewable Energy 23',
    'Loans',
    '2023-01-01',
    '2027-12-31',
    '9282748.44',
    '7',
    '34',
    '9',
    '2'
  ),
  (
    'Wind Energy 19',
    'Energy',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '30',
    '9',
    '2'
  ),
  (
    'Wind Energy 20',
    'Energy',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '31',
    '9',
    '1'
  ),
  (
    'Wind Energy 21',
    'Energy',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '32',
    '9',
    '2'
  ),
  (
    'Solar Energy 19',
    'Energy',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '33',
    '8',
    '2'
  ),
  (
    'Solar Energy 20',
    'Energy',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '34',
    '8',
    '2'
  ),
  (
    'Solar Energy 21',
    'Energy',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '35',
    '8',
    '1'
  ),
  (
    'Thermal Energy 19',
    'Energy',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '36',
    '8',
    '2'
  ),
  (
    'Thermal Energy 20',
    'Energy',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '37',
    '8',
    '2'
  ),
  (
    'Thermal Energy 21',
    'Energy',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '38',
    '9',
    '1'
  ),
  (
    'New Database System 19',
    'Energy',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '39',
    '9',
    '2'
  ),
  (
    'New Database System 20',
    'Energy',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '40',
    '9',
    '2'
  ),
  (
    'New Database System 21',
    'Energy',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '41',
    '9',
    '2'
  ),
  (
    'New Supercomputer 19',
    'Computers',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '42',
    '6',
    '1'
  ),
  (
    'New Supercomputer 20',
    'Computers',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '43',
    '6',
    '2'
  ),
  (
    'New Supercomputer 21',
    'Computers',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '44',
    '6',
    '2'
  ),
  (
    '5G Telecommunications 19',
    'Energy',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '45',
    '5',
    '1'
  ),
  (
    '5G Telecommunications 20',
    'Energy',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '46',
    '5',
    '2'
  ),
  (
    '5G Telecommunications 21',
    'Energy',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '47',
    '5',
    '2'
  ),
  (
    'Cement Research 19',
    'Cements',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '48',
    '4',
    '2'
  ),
  (
    'Cement Research 20',
    'Cements',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '49',
    '4',
    '1'
  ),
  (
    'Cement Research 21',
    'Cements',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '50',
    '3',
    '2'
  ),
  (
    'Nanomaterials 19',
    'Energy',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '51',
    '9',
    '2'
  ),
  (
    'Nanomaterials 20',
    'Energy',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '52',
    '9',
    '1'
  ),
  (
    'Nanomaterials 21',
    'Energy',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '53',
    '10',
    '2'
  ),
  (
    'Nanomaterials 22',
    'Energy',
    '2022-01-01',
    '2026-12-31',
    '9182748.44',
    '7',
    '54',
    '10',
    '2'
  ),
  (
    'Networks of the future 19',
    'Computers',
    '2019-01-01',
    '2023-12-31',
    '8882748.44',
    '7',
    '55',
    '10',
    '1'
  ),
  (
    'Networks of the future 20',
    'Computers',
    '2020-01-01',
    '2024-12-30',
    '8982748.44',
    '7',
    '56',
    '10',
    '2'
  ),
  (
    'Networks of the future 21',
    'Computers',
    '2021-01-01',
    '2025-12-31',
    '9082748.44',
    '7',
    '57',
    '10',
    '2'
  ),
  (
    'Networks of the future 22',
    'Computers',
    '2022-01-01',
    '2026-12-31',
    '9182748.44',
    '7',
    '58',
    '10',
    '1'
  );

CREATE TABLE `project_scientific_fields` (
  `project_id` bigint unsigned NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id),
  `scientific_field_id` bigint unsigned NOT NULL,
  FOREIGN KEY (scientific_field_id) REFERENCES scientific_fields(id),
  PRIMARY KEY (project_id, scientific_field_id)
);

INSERT INTO
  project_scientific_fields (project_id, scientific_field_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 1),
  (3, 2),
  (3, 3),
  (4, 1),
  (4, 2),
  (5, 1),
  (5, 2),
  ('5', '3'),
  ('6', '1'),
  ('6', '2'),
  ('6', '3'),
  ('6', '4'),
  ('6', '5'),
  ('11', '1'),
  ('11', '2'),
  ('12', '2'),
  ('13', '2'),
  ('14', '1'),
  ('14', '2'),
  ('15', '1'),
  ('15', '2'),
  ('15', '3'),
  ('34', '3'),
  ('34', '4'),
  ('35', '3'),
  ('35', '4'),
  ('36', '3'),
  ('36', '4'),
  ('36', '5'),
  ('37', '4'),
  ('37', '5'),
  ('37', '6'),
  ('37', '7'),
  ('38', '1'),
  ('38', '2'),
  ('38', '3'),
  ('39', '3'),
  ('39', '4'),
  ('39', '5'),
  ('39', '6'),
  ('40', '5'),
  ('40', '6'),
  ('41', '5'),
  ('42', '5'),
  ('42', '6'),
  ('42', '7'),
  ('43', '2'),
  ('43', '3'),
  ('44', '1'),
  ('44', '2'),
  ('45', '1'),
  ('46', '1'),
  ('47', '3'),
  ('47', '4'),
  ('48', '2'),
  ('48', '3'),
  ('48', '4'),
  ('48', '5'),
  ('49', '1'),
  ('50', '1'),
  ('50', '2'),
  ('51', '1'),
  ('52', '1'),
  ('52', '2'),
  ('52', '3'),
  ('52', '4'),
  ('53', '2'),
  ('53', '3'),
  ('54', '4'),
  ('55', '5'),
  ('56', '6'),
  ('57', '7'),
  ('58', '1'),
  ('58', '2'),
  ('58', '3'),
  ('59', '5'),
  ('60', '5'),
  ('60', '6'),
  ('61', '5'),
  ('62', '6'),
  ('63', '3'),
  ('63', '4'),
  ('63', '5'),
  ('63', '6'),
  ('63', '7'),
  ('64', '1'),
  ('64', '2'),
  ('64', '3'),
  ('64', '4'),
  ('64', '5'),
  ('64', '6'),
  ('64', '7'),
  ('65', '1'),
  ('65', '2'),
  ('65', '3'),
  ('65', '4'),
  ('65', '5'),
  ('65', '6'),
  ('65', '7');

CREATE TABLE `researcher_works_on_project` (
  `project_id` bigint unsigned NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id),
  `researcher_id` bigint unsigned NOT NULL,
  FOREIGN KEY (researcher_id) REFERENCES researchers(id),
  PRIMARY KEY (project_id, researcher_id)
);

INSERT INTO
  researcher_works_on_project (project_id, researcher_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  ('5', '1'),
  ('5', '2'),
  ('5', '3'),
  ('6', '1'),
  ('6', '2'),
  ('6', '3'),
  ('6', '4'),
  ('6', '5'),
  ('11', '1'),
  ('11', '2'),
  ('12', '2'),
  ('13', '2'),
  ('14', '1'),
  ('14', '2'),
  ('15', '1'),
  ('15', '2'),
  ('15', '3'),
  ('34', '3'),
  ('34', '4'),
  ('35', '3'),
  ('35', '4'),
  ('36', '3'),
  ('36', '4'),
  ('36', '5'),
  ('37', '4'),
  ('37', '5'),
  ('37', '6'),
  ('37', '7'),
  ('38', '1'),
  ('38', '2'),
  ('38', '3'),
  ('39', '3'),
  ('39', '4'),
  ('39', '5'),
  ('39', '6'),
  ('40', '5'),
  ('40', '6'),
  ('41', '5'),
  ('42', '5'),
  ('42', '6'),
  ('42', '7'),
  ('43', '2'),
  ('43', '3'),
  ('44', '1'),
  ('44', '2'),
  ('45', '1'),
  ('46', '1'),
  ('47', '3'),
  ('47', '4'),
  ('48', '2'),
  ('48', '3'),
  ('48', '4'),
  ('48', '5'),
  ('49', '1'),
  ('50', '1'),
  ('50', '2'),
  ('51', '1'),
  ('52', '1'),
  ('52', '2'),
  ('52', '3'),
  ('52', '4'),
  ('53', '2'),
  ('53', '3'),
  ('54', '4'),
  ('55', '5'),
  ('56', '6'),
  ('57', '7'),
  ('58', '1'),
  ('58', '2'),
  ('58', '3'),
  ('59', '5'),
  ('60', '5'),
  ('60', '6'),
  ('61', '5'),
  ('62', '6'),
  ('63', '3'),
  ('63', '4'),
  ('63', '5'),
  ('63', '6'),
  ('63', '7'),
  ('64', '1'),
  ('64', '2'),
  ('64', '3'),
  ('64', '4'),
  ('64', '5'),
  ('64', '6'),
  ('64', '7'),
  ('65', '1'),
  ('65', '2'),
  ('65', '3'),
  ('65', '4'),
  ('65', '5'),
  ('65', '6'),
  ('65', '7');

-- The deliverables table
CREATE TABLE `deliverables` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_of_delivery` date NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id)
);

INSERT INTO
  deliverables (title, description, date_of_delivery, project_id)
VALUES
  (
    'Hello 1',
    'Hand Over the Work 1',
    '2020-01-01',
    '5'
  ),
  (
    'Hello 2',
    'Hand Over the Work 2',
    '2020-01-02',
    '6'
  ),
  (
    'Hello 3',
    'Hand Over the Work 3',
    '2020-01-03',
    '11'
  ),
  (
    'Hello 4',
    'Hand Over the Work 4',
    '2020-01-04',
    '12'
  ),
  (
    'Hello 5',
    'Hand Over the Work 5',
    '2020-01-05',
    '13'
  ),
  (
    'Hello 6',
    'Hand Over the Work 6',
    '2020-01-06',
    '14'
  ),
  (
    'Hello 7',
    'Hand Over the Work 7',
    '2020-01-07',
    '15'
  ),
  (
    'Hello 8',
    'Hand Over the Work 8',
    '2020-01-08',
    '38'
  ),
  (
    'Hello 9',
    'Hand Over the Work 9',
    '2020-01-09',
    '43'
  ),
  (
    'Hello 10',
    'Hand Over the Work 10',
    '2020-01-10',
    '44'
  ),
  (
    'Hello 11',
    'Hand Over the Work 11',
    '2020-01-11',
    '48'
  ),
  (
    'Hello 12',
    'Hand Over the Work 12',
    '2020-01-12',
    '50'
  ),
  (
    'Hello 13',
    'Hand Over the Work 13',
    '2020-01-13',
    '52'
  ),
  (
    'Hello 14',
    'Hand Over the Work 14',
    '2020-01-14',
    '53'
  ),
  (
    'Hello 15',
    'Hand Over the Work 15',
    '2020-01-15',
    '58'
  ),
  (
    'Hello 16',
    'Hand Over the Work 16',
    '2020-01-16',
    '64'
  ),
  (
    'Hello 17',
    'Hand Over the Work 17',
    '2020-01-17',
    '65'
  ),
  (
    'Hello 18',
    'Hand Over the Work 18',
    '2020-01-17',
    '34'
  ),
  (
    'Hello 19',
    'Hand Over the Work 19',
    '2020-01-17',
    '39'
  ),
  (
    'Hello 20',
    'Hand Over the Work 20',
    '2020-01-17',
    '47'
  ),
  (
    'Hello 21',
    'Hand Over the Work 21',
    '2020-01-17',
    '1'
  );

-- The evaluations table
CREATE TABLE `evaluations` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `grade` varchar(255) NOT NULL,
  `date_of_evaluation` date NOT NULL,
  `researcher_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  FOREIGN KEY (researcher_id) REFERENCES researchers(id),
  FOREIGN KEY (project_id) REFERENCES projects(id)
);

INSERT INTO
  evaluations (
    grade,
    date_of_evaluation,
    researcher_id,
    project_id
  )
VALUES
  (
    '10',
    '2022-01-06',
    4,
    1
  );

CREATE VIEW projects_per_researcher_all_relations AS
SELECT
  'Scientific Director' AS TYPE,
  researchers.id AS researcher_id,
  researchers.first_name AS researcher_first_name,
  researchers.last_name AS researcher_last_name,
  researchers.date_of_birth AS researcher_date_of_birth,
  researchers.sex AS researcher_sex,
  researchers.date_of_employment AS researcher_date_of_employment,
  researchers.organization_id AS researcher_organization_id,
  projects.id AS project_id,
  projects.title AS project_title,
  projects.description AS project_description,
  projects.start_date AS project_start_date,
  projects.end_date AS project_end_date,
  projects.budget AS project_budget,
  projects.executive_id AS project_executive_id,
  projects.scientific_director_researcher_id AS project_scientific_director_researcher_id
FROM
  researchers
  JOIN projects ON researchers.id = projects.scientific_director_researcher_id
UNION
(
  SELECT
    'Works' AS type,
    researchers.id AS researcher_id,
    researchers.first_name AS researcher_first_name,
    researchers.last_name AS researcher_last_name,
    researchers.date_of_birth AS researcher_date_of_birth,
    researchers.sex AS researcher_sex,
    researchers.date_of_employment AS researcher_date_of_employment,
    researchers.organization_id AS researcher_organization_id,
    projects.id AS project_id,
    projects.title AS project_title,
    projects.description AS project_description,
    projects.start_date AS project_start_date,
    projects.end_date AS project_end_date,
    projects.budget AS project_budget,
    projects.executive_id AS project_executive_id,
    projects.scientific_director_researcher_id AS project_scientific_director_researcher_id
  FROM
    researchers
    JOIN researcher_works_on_project ON researchers.id = researcher_works_on_project.researcher_id
    JOIN projects ON researcher_works_on_project.project_id = projects.id
)
UNION
(
  SELECT
    'Evaluates' AS type,
    researchers.id AS researcher_id,
    researchers.first_name AS researcher_first_name,
    researchers.last_name AS researcher_last_name,
    researchers.date_of_birth AS researcher_date_of_birth,
    researchers.sex AS researcher_sex,
    researchers.date_of_employment AS researcher_date_of_employment,
    researchers.organization_id AS researcher_organization_id,
    projects.id AS project_id,
    projects.title AS project_title,
    projects.description AS project_description,
    projects.start_date AS project_start_date,
    projects.end_date AS project_end_date,
    projects.budget AS project_budget,
    projects.executive_id AS project_executive_id,
    projects.scientific_director_researcher_id AS project_scientific_director_researcher_id
  FROM
    researchers
    JOIN evaluations ON researchers.id = evaluations.researcher_id
    JOIN projects ON evaluations.project_id = projects.id
);

CREATE VIEW research_centers_scientific_fields AS
SELECT
  DISTINCT research_centers.organization_id AS organization_id,
  organizations.abbreviation AS organization_abbreviation,
  organizations.name AS organization_name,
  research_centers.ministry_of_education_budget,
  research_centers.private_funding_budget,
  scientific_fields.id AS scientific_field_id,
  scientific_fields.name AS scientific_field_name
FROM
  research_centers
  JOIN organizations ON research_centers.organization_id = organizations.id
  JOIN projects ON projects.managing_organization_id = organizations.id
  JOIN project_scientific_fields ON projects.id = project_scientific_fields.project_id
  JOIN scientific_fields ON project_scientific_fields.scientific_field_id = scientific_fields.id
ORDER BY
  organizations.name