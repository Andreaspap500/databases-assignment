<?php
session_start();

if (!(isset($_SESSION['login']))) {

    header('location:../index.php');
}

include('../config/DatabaseRepository.php');
$obj = new DbFunction();

$query = $obj->show_projects_per_researcher_all_relations();
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
                                View Programs/Projects per Researcher (all Relations)
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="dataTable_wrapper">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>TYPE</th>
                                                <th>researcher_id</th>
                                                <th>researcher_first_name</th>
                                                <th>researcher_last_name</th>
                                                <th>researcher_date_of_birth</th>
                                                <th>researcher_sex</th>
                                                <th>researcher_date_of_employment</th>
                                                <th>project_id</th>
                                                <th>project_title</th>
                                                <th>project_description</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            while ($result = $query->fetch_object()) { ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo htmlentities($result->TYPE); ?></td>
                                                    <td><?php echo htmlentities($result->researcher_id); ?></td>
                                                    <td><?php echo htmlentities($result->researcher_first_name); ?></td>
                                                    <td><?php echo htmlentities($result->researcher_last_name); ?></td>
                                                    <td><?php echo htmlentities($result->researcher_date_of_birth); ?></td>
                                                    <td><?php echo htmlentities($result->researcher_sex); ?></td>
                                                    <td><?php echo htmlentities($result->researcher_date_of_employment); ?></td>
                                                    <td><?php echo htmlentities($result->project_id); ?></td>
                                                    <td><?php echo htmlentities($result->project_title); ?></td>
                                                    <td><?php echo htmlentities($result->project_description); ?></td>
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