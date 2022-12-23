<?php
session_start();
if (!isset($_SESSION['id'])) {
    header('location:../');
}
$data = $_SESSION['data'];
if ($_SESSION['status'] == 1) {
    $status = '<b class="text-success">Voted</b>';
} else {
    $status = '<b class="text-danger">Not Voted</b>';
}
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
        <h1 class="my-3">Voting System</h1>
        <div class="row my-5">
            <div class="col-md-7">
                <?php
                if (isset($_SESSION['groups'])) {
                    $groups = $_SESSION['groups'];
                    $username = $_SESSION['username'];
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

                            </div>
                        </div>

                        <form action="../actions/voting.php" method="POST">
                            <!-- check -->
                            <input type="hidden" name='groupvotes' value="<?php echo $groups[$i]['votes'] ?>">
                            <input type="hidden" name='groupid' value="<?php echo $groups[$i]['id'] ?>">
                            <input type="hidden" name='votedby' value="<?php echo $username ?>">
                            <input type="hidden" name='votedto' value="<?php echo $groups[$i]['username'] ?>">


                            <?php
                            if ($_SESSION['status'] == 1) {
                                // echo '<script>
                                // alert("Technical error!! Make sure you voted to YSR cp");
                                // </script>';
                            ?>
                                <!-- <button class="bg-success my-4 text-white px-3">voted</button> -->

                            <?php
                            } else {
                            ?>
                                <button class="bg-danger my-3 text-white px-3" type="submit">vote</button>
                            <?php
                            }
                            ?>
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
            <div class="col-md-5">
                <!--user profile-->
                <img src="../uploads/<?php echo $data['photo'] ?>" alt="User image">
                <br>
                <br>
                <strong class="text-dark h5">User Name:</strong>
                <?php echo $data['username']; ?><br><br>
                <strong class="text-dark h5">Mobile Number:</strong>
                <?php echo $data['mobile']; ?><br><br>
                <strong class="text-dark h5">Status:</strong>
                <?php echo $status; ?><br><br>

                <?php
                if(! is_null($data['votedto'])){
                    ?>
                    <strong class="text-dark h5">Voted To:</strong>
                    <?php echo $data['votedto']; ?><br><br>
                    <?php
                }
                ?>

            </div>

        </div>

    </div>
</body>

</html>