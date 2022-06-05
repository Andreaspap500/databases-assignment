<?php
session_start();

if (!(isset($_SESSION['login']))) {

    header('location:../index.php');
}

include('../config/DatabaseRepository.php');
$obj = new DbFunction();

$query = $obj->show_organizations_with_consecutive_years_same_projects();
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
                                View Organizations With Consecutive Years Same Projects
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="dataTable_wrapper">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>abbreviation</th>
                                                <th>name</th>
                                                <th>project_year</th>
                                                <th>number_of_projects</th>
                                                <th>next_year</th>
                                                <th>next_year_number_of_projects</th>
                                             
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            while ($result = $query->fetch_object()) { ?>
                                                <tr class="odd gradeX">
                                                    <td><?php echo htmlentities($result->id); ?></td>
                                                    <td><?php echo htmlentities($result->abbreviation); ?></td>
                                                    <td><?php echo htmlentities($result->name); ?></td>
                                                    <td><?php echo htmlentities($result->project_year); ?></td>
                                                    <td><?php echo htmlentities($result->number_of_projects); ?></td>
                                                    <td><?php echo htmlentities($result->next_year); ?></td>
                                                    <td><?php echo htmlentities($result->next_year_number_of_projects); ?></td>

                                                

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