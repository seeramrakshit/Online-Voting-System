<?php
session_start();
if (!isset($_SESSION['id'])) {
    header('location:../partials/adminIndex.php');
}
$data = $_SESSION['data'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting System Dashboard</title>
    <!-- Bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!--css file-->
    <link rel="stylesheet" href="../style.css">
</head>

<body class="bg-secondary text-light">
    <div class="container my-5">
        <a href="../"><button class="btn btn-dark text-light px-3">Back</button></a>
        <a href="logout.php"><button class="btn btn-dark text-light px-3">Logout</button></a>



        <form action="votedetails.php" method="POST">

            <!-- <?php
                    // $groupvotedetails = $_SESSION['groupvotedetails'];
                    ?> -->

            <!-- check -->
            <!-- <input type="hidden" name='vot' value="<?php echo $groupvotedetails ?>"> -->
            <button class="bg-danger my-3 text-white px-3" type="submit">Vote Details</button>
        </form>


        <h1 class="my-3">Voting System</h1>
        <div class="row my-5">
            <div class="col-md-7">
                <?php
                if (isset($_SESSION['groups'])) {
                    $groups = $_SESSION['groups'];
                    for ($i = 0; $i < count($groups); $i++) {
                ?>
                        <div class="row">
                            <div class="col-md-4">
                                <img src="../uploads/<?php echo $groups[$i]['photo'] ?>" alt="Group Image">
                            </div>
                            <div class="col-md-8">
                                <strong class="text-dark h5">Group Name:</strong>
                                <?php echo $groups[$i]['username'] ?>
                                <br>
                                <strong class="text-dark h5">Votes:</strong>
                                <?php echo $groups[$i]['votes'] ?>
                                <br>
                                
                            </div>
                        </div>

                        <form action="../actions/voting.php" method="POST">
                            <input type="hidden" name='groupvotes' value="<?php echo $groups[$i]['votes'] ?>">
                            <input type="hidden" name='groupid' value="<?php echo $groups[$i]['id'] ?>">


                        </form>
                        <hr>
                    <?php
                    }
                } else {
                    ?>
                    <div class="container">
                        <p>No groups to display</p>
                    </div>
                <?php
                }
                ?>

                <!--groups-->

            </div>
            <!-- adding the sorted groups -->
            <div class="col-md-5">
                <h1>Standings</h1>
                
                
                <?php
                    if (isset($_SESSION['sortedGroup'])) {
                        $sortedGroup = $_SESSION['sortedGroup'];
                    ?>
                        <table class="table table-bordered table-hover" >
                            <thead>
                                <tr class="table-danger table-success">
                                    <!-- success danger warning info -->
                                <th scope="col">Group Name</th>
                                <th scope="col">Votes</th>
                                </tr>
                            </thead>
                            <?php
                            for($i=0;$i<count($sortedGroup);$i++){
                                ?>
                                <tr class="table-info table-success">
                                    <!-- success danger warning info -->
                                    <td>
                                        <!-- <strong class="text-dark h5">Group Name:</strong> -->
                                        <?php echo $sortedGroup[$i]['username'] ?>
                                        <br>
                                    </td>
                                    <td>
                                        <!-- <strong class="text-dark h5">Votes:</strong> -->
                                        <?php echo $sortedGroup[$i]['votes'] ?>
                                        <br>
                                    </td>
                                </tr>

                                
                            <?php
                            }
                            ?>
                        </table>

                        <?php
                    } else {
                        ?>
                        <div class="container">
                            <p>No groups to display</p>
                        </div>
                    <?php
                    }
                    
                    ?>

            </div>

        </div>

    </div>
</body>

</html>