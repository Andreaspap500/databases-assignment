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
    'AKTOR',
    'Aktor-constructions',
    '19556',
    'Athens',
    'Kifisias 156'
  );

-- The organization_phones table
CREATE TABLE `organization_phones` (
  `organization_id` bigint unsigned NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

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
  (1, 500000000.80, 140000000.10),
  (2, 88928000.44, 28900000.24);

-- The universities table
CREATE TABLE `universities` (
  `organization_id` bigint unsigned NOT NULL PRIMARY KEY,
  `ministry_of_education_budget` decimal(20, 2) unsigned NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

-- The companies table
CREATE TABLE `companies` (
  `organization_id` bigint unsigned NOT NULL PRIMARY KEY,
  `idia_kefalaia` decimal(20, 2) unsigned NOT NULL,
  FOREIGN KEY (organization_id) REFERENCES organizations(id)
);

-- The scientific_fields table
CREATE TABLE `scientific_fields` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

INSERT INTO
  `scientific_fields` (`name`)
VALUES
  ('Electrical Engineering'),
  ('Computer Science'),
  ('Civil Engineering');

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
  ('Recycling Actions II', 'Stadiou 10');

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
  ('Anastasia Georgiou');

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
    'Clean Sea 22',
    'Cleaning The Mediteranean using new technologies',
    '2022-01-05',
    '2025-02-06',
    '1255000.88',
    1,
    3,
    1,
    1
  ),
  (
    'Athens Waste Management',
    'Recycling Materials in new facilities',
    '2015-03-03',
    '2019-04-04',
    '3500000.49',
    2,
    4,
    2,
    2
  ),
  (
    'Clean Sea 21',
    'Cleaning The Mediteranean using new technologies',
    '2021-01-05',
    '2025-02-06',
    '1255000.88',
    1,
    3,
    1,
    1
  ),
  (
    'Clean Sea 20',
    'Cleaning The Mediteranean using new technologies',
    '2020-01-05',
    '2022-02-06',
    '1255000.88',
    1,
    3,
    1,
    1
  ),
  (
    'Clean Sea 18',
    'Cleaning The Mediteranean using new technologies',
    '2018-01-05',
    '2022-02-06',
    '1255000.88',
    1,
    3,
    1,
    1
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
  (5, 2);

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
  (1, 3);

-- The deliverables table
CREATE TABLE `deliverables` (
  `id` bigint unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_of_delivery` date NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  FOREIGN KEY (project_id) REFERENCES projects(id)
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