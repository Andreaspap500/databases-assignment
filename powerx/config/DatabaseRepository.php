
<?php
require('Database.php');
//$db = Database::getInstance();
//$mysqli = $db->getConnection();
class DbFunction
{
	function login($loginid, $password)
	{

		if (!ctype_alpha($loginid) || !ctype_alpha($password)) {

			echo "<script>alert('Either LoginId or Password is Missing')</script>";
		} else {
			$db = Database::getInstance();
			$mysqli = $db->getConnection();
			$query = "SELECT loginid, password FROM users where loginid=? and password=? ";
			$stmt = $mysqli->prepare($query);
			if (false === $stmt) {

				trigger_error("Error in query: " . mysqli_connect_error(), E_USER_ERROR);
			} else {
				// Prevent SQL injection
				$stmt->bind_param('ss', $loginid, $password);
				$stmt->execute();
				$stmt->bind_result($loginid, $password);
				$rs = $stmt->fetch();
				if (!$rs) {
					echo "<script>alert('Invalid Details')</script>";
					header('location:login.php');
				} else {

					header('location:programs-projects.php');
				}
			}
		}
	}

	function runQuery($query)
	{
		$db = Database::getInstance();
		$mysqli = $db->getConnection();
		return $mysqli->query($query);
	}

	function checkIfParameterNotEmpty($parameter)
	{
		return $parameter != null && $parameter != "";
	}

	function showProjectsPrograms($start_date, $duration, $executive)
	{
		$query = "
		SELECT
			programs.name AS program_name,
			programs.address AS program_address,
			projects.*,
			organizations.abbreviation AS organization_abbreviation,
			executives.name AS executive_name
		FROM programs
			JOIN projects ON programs.id = projects.program_id
			JOIN organizations ON projects.managing_organization_id = organizations.id
			JOIN executives ON projects.executive_id = executives.id
		WHERE 1
		";

		// Construct where clause
		// echo $start_date;
		if ($this->checkIfParameterNotEmpty($start_date)) {
			$query = $query . " AND start_date ='" . $start_date . "'";
		}
		if ($this->checkIfParameterNotEmpty($duration)) {
			// " AND DATEDIFF(end_date,start_date) = duration"
			$query = $query . "AND DATEDIFF(end_date,start_date) =" . $duration;
		}
		if ($this->checkIfParameterNotEmpty($executive)) {
			// " AND executives.name like '%nameOfExecutive%'"
			$query = $query . " AND executives.name like '%" . $executive . "%'";
		}
		// echo $query;
		$query = $query . "
		ORDER BY programs.name;";

		return $this->runQuery($query);
	}

	function showProjectWorkers($project_id)
	{
		$db = Database::getInstance();
		$mysqli = $db->getConnection();

		$query = "
		SELECT researchers.*, organizations.name AS organization_name
		FROM researchers
			JOIN researcher_works_on_project ON researchers.id = researcher_works_on_project.researcher_id
			JOIN organizations ON organizations.id=researchers.organization_id
		WHERE researcher_works_on_project.project_id = " . $project_id . "
		ORDER BY researchers.last_name, researchers.first_name;
		";

		return $mysqli->query($query);
	}

	function show_projects_per_researcher_all_relations()
	{
		$query = "SELECT * FROM projects_per_researcher_all_relations";
		return $this->runQuery($query);
	}

	function show_research_centers_scientific_fields()
	{
		$query = "SELECT * FROM research_centers_scientific_fields";
		return $this->runQuery($query);
	}

	function show_scientific_fields()
	{
		$query = "SELECT * FROM scientific_fields ORDER BY name;";

		return $this->runQuery($query);
	}

	function show_active_project_researchers_per_scientific_field($scientific_field_id)
	{
		$query = "
		SELECT
			*
		FROM
			projects_per_researcher_all_relations
		JOIN project_scientific_fields ON projects_per_researcher_all_relations.project_id = project_scientific_fields.project_id
		WHERE
			project_scientific_fields.scientific_field_id = " . $scientific_field_id . " 
			AND project_start_date <= NOW() 
			AND (project_end_date >= NOW() OR project_end_date IS NULL);
		";

		return $this->runQuery($query);
	}

	function show_organizations_with_consecutive_years_same_projects()
	{
		$query = "
		SELECT
			*
		FROM
			(
			SELECT
				*,
				LAG(project_year, 1) OVER(
				PARTITION BY id
			ORDER BY
				project_year
			DESC
			) AS next_year,
			LAG(number_of_projects, 1) OVER(
			PARTITION BY id
		ORDER BY
			project_year
		DESC
		) AS next_year_number_of_projects
		FROM
			(
			SELECT
				organizations.id,
				organizations.abbreviation,
				organizations.name,
				YEAR(projects.start_date) AS project_year,
				COUNT(1) AS number_of_projects
			FROM
				organizations
			JOIN projects ON organizations.id = projects.managing_organization_id
			GROUP BY
				organizations.id,
				organizations.abbreviation,
				organizations.name,
				project_year
			ORDER BY
				organizations.name,
				project_year
		) AS organization_projects_per_year
		WHERE
			number_of_projects > 10
		) AS sub
		WHERE
			next_year = project_year + 1 AND number_of_projects = next_year_number_of_projects;
			";

		return $this->runQuery($query);
	}

	function show_top_3_scientific_field_tuples()
	{
		$query = "
		SELECT
			psf.scientific_field_id,
			sf.name,
			psf2.scientific_field_id AS scientific_field_id_2,
			sf2.name AS name_2,
			COUNT(1) AS COUNT
		FROM
			project_scientific_fields AS psf
		JOIN project_scientific_fields AS psf2
		ON
			psf.project_id = psf2.project_id AND psf.scientific_field_id < psf2.scientific_field_id
		JOIN scientific_fields AS sf
		ON
			psf.scientific_field_id = sf.id
		JOIN scientific_fields AS sf2
		ON
			psf2.scientific_field_id = sf2.id
		GROUP BY
			psf.scientific_field_id,
			sf.name,
			psf2.scientific_field_id,
			sf2.name
		ORDER BY
			COUNT
		DESC
		LIMIT 3;";

		return $this->runQuery($query);
	}

	function show_researchers_ordered_by_number_of_projects_desc()
	{
		$query = "
		SELECT
			researcher_id,
			researcher_first_name,
			researcher_last_name,
			COUNT(1) AS number_of_projects
		FROM
			`projects_per_researcher_all_relations`
		WHERE
			`type` = 'Works' AND project_start_date <= NOW() AND(
				project_end_date >= NOW() OR project_end_date IS NULL) AND DATEDIFF(
					NOW(), researcher_date_of_birth) / 365 <= 40
				GROUP BY
					researcher_id,
					researcher_first_name,
					researcher_last_name
				ORDER BY
					number_of_projects
				DESC
            ;";

		return $this->runQuery($query);
	}

	function show_researchers_with_at_least_5_projects_with_no_deliverables()
	{
		$query = "
		SELECT
			researcher_id,
			researcher_first_name,
			researcher_last_name,
			COUNT(1) AS number_of_projects
		FROM
			projects_per_researcher_all_relations
		WHERE NOT
			EXISTS(
			SELECT
				1
			FROM
				deliverables
			WHERE
				deliverables.project_id = projects_per_researcher_all_relations.project_id
		)
		GROUP BY
			researcher_id,
			researcher_first_name,
			researcher_last_name
		HAVING number_of_projects >= 5
		ORDER BY
			researcher_last_name, researcher_first_name
		DESC;
		";

		return $this->runQuery($query);
	}

	function show_top_5_by_funding_executives()
	{
		$query = "
		SELECT
			executives.id,
			executives.name AS executive_name,
			organizations.name AS organization_name,
			SUM(projects.budget) AS total_funding
		FROM
			executives
		JOIN projects ON executives.id = projects.executive_id
		JOIN organizations ON projects.managing_organization_id = organizations.id
		JOIN companies ON organizations.id = companies.organization_id
		GROUP BY
			executives.id,
			executives.name,
			organizations.name
		ORDER BY
			total_funding
		DESC
		LIMIT 5
		";

		return $this->runQuery($query);
	}
}

?>



