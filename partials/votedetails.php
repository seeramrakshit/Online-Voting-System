<?php
session_start();
include('../actions/connect.php');

if (!isset($_SESSION['id'])) {
    header('location:../partials/adminIndex.php');
}
$data = $_SESSION['data'];
$groupvotedetails = $_SESSION['groupvotedetails'];



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Details</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>


<body>



    


    <div>

    <table class="table table-bordered table-hover" >
                            <thead>
                                <tr class="table-danger table-success">
                                    <!-- success danger warning info -->
                                <th scope="col">User Name</th>
                                <th scope="col">Voted To</th>
                                </tr>
                            </thead>
                            <?php
                            for($i=0;$i<count($groupvotedetails);$i++){
                                ?>
                                <tr class="table-info table-success">
                                    <!-- success danger warning info -->
                                    <td>
                                        <!-- <strong class="text-dark h5">Group Name:</strong> -->
                                        <?php echo $groupvotedetails[$i]['username'] ?>
                                        <br>
                                    </td>
                                    <td>
                                        <!-- <strong class="text-dark h5">Votes:</strong> -->
                                        <?php echo $groupvotedetails[$i]['votedto'] ?>
                                        <br>
                                    </td>
                                </tr>

                                
                            <?php
                            }
                            ?>
                        </table>

    </div>

</body>


</html>