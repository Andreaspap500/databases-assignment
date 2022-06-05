<?php
session_start();

if (!(isset($_SESSION['login']))) {

    header('location:../index.php');
}

include('../config/DatabaseRepository.php');
$obj = new DbFunction();

$start_date = null;
$duration = null;
$executive = null;
if (isset($_GET['start_date'])) {
    $start_date = $_GET['start_date'];
}
if (isset($_GET['duration'])) {
    $duration = $_GET['duration'];
}
if (isset($_GET['executive'])) {
    $executive = $_GET['executive'];
}
$projectsProgramsQuery = $obj->showProjectsPrograms($start_date, $duration, $executive);

$project_id = null;
if (isset($_GET['project_id'])) {
    $project_id = $_GET['project_id'];
}
$projectWorkers = null;
if ($project_id != null) {
    $projectWorkers = $obj->showProjectWorkers($project_id);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>view course</title>
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <?php include('leftbar.php') ?>;


        <nav>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header"> <?php echo strtoupper("welcome" . " " . htmlentities($_SESSION['login'])); ?></h4>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                View Programs/Projects
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <!-- Filters for the table -->
                                <form action="programs-projects.php" method="get">
                                    <div>
                                        <div class="form-group">
                                            <div class="col-lg-4">
                                                <label>Date (In format YYYY-MM-DD)</label>
                                            </div>
                                            <div class="col-lg-6">
                                                <input class="form-control" name="start_date" id="start_date" value="<?php echo $start_date ?>">
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                                <label>Duration (enter number in days)</label>
                                            </div>
                                            <div class="col-lg-6">
                                                <input class="form-control" name="duration" id="duration" value="<?php echo $duration ?>">
                                                </select>
                                            </div>
                                            <div class="col-lg-4">
                                                <label>Executive (type full or part of the xecutive name)</label>
                                            </div>
                                            <div class="col-lg-6">
                                                <input class="form-control" name="executive" id="executive" value="<?php echo $executive ?>">
                                                </select>
                                            </div>
                                            <div class="col-lg-6"><br><br>
                                                <input type="submit" class="btn btn-primary" name="submit" value="Search"></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="dataTable_wrapper">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Program Name</th>
                                                <th>Program Address</th>
                                                <th>Project Title</th>
                                                <th>Description</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Budget</th>
                                                <th>Managing Organization</th>
                                                <th>Executive</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            while ($result = $projectsProgramsQuery->fetch_object()) { ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo htmlentities($result->program_name); ?></td>
                                                    <td><?php echo htmlentities($result->program_address); ?></td>
                                                    <td><?php echo htmlentities($result->title); ?></td>
                                                    <td><?php echo htmlentities($result->description); ?></td>
                                                    <td><?php echo htmlentities($result->start_date); ?></td>
                                                    <td><?php echo htmlentities($result->end_date); ?></td>
                                                    <td><?php echo htmlentities($result->budget); ?></td>
                                                    <td><?php echo htmlentities($result->organization_abbreviation); ?></td>
                                                    <td><?php echo htmlentities($result->executive_name); ?></td>
                                                    <td>&nbsp;&nbsp;
                                                        <a href="programs-projects.php?project_id=<?php echo htmlentities($result->id); ?>">
                                                        <button>View</button>
                                                        </a>
                                                    </td>
                                                    </td>

                                                </tr>

                                            <?php
                                            } ?>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

                <?php
                if ($project_id != null) { ?>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    View Researchers Working
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="dataTable_wrapper">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Researcher ID</th>
                                                    <th>First Name</th>
                                                    <th>Last Name</th>
                                                    <th>Birthdate</th>
                                                    <th>Sex</th>
                                                    <th>Date Of Employment</th>
                                                    <th>Organization</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php
                                                if ($projectWorkers != null) {
                                                    while ($result = $projectWorkers->fetch_object()) { ?>
                                                        <tr class="odd gradeX">
                                                            <td><?php echo htmlentities($result->id); ?></td>
                                                            <td><?php echo htmlentities($result->first_name); ?></td>
                                                            <td><?php echo htmlentities($result->last_name); ?></td>
                                                            <td><?php echo htmlentities($result->date_of_birth); ?></td>
                                                            <td><?php echo htmlentities($result->sex); ?></td>
                                                            <td><?php echo htmlentities($result->date_of_employment); ?></td>
                                                            <td><?php echo htmlentities($result->organization_name); ?></td>

                                                        </tr>

                                                <?php
                                                    }
                                                } ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                <?php } ?>

            </div>
            <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <!-- <script>
        $(document).ready(function() {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });
    </script> -->

</body>

</html>