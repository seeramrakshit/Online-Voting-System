<?php
session_start();
include('../actions/connect.php');

$username = $_POST['username'];
$password = $_POST['password'];
$sql = "select * from `admindata` where username='$username' and password='$password' ";
$result = mysqli_query($con, $sql);
if (mysqli_num_rows($result) > 0) {
    $sql = "select username,photo,votes,id from `userdata` where standard='group'";
    $resultgroup = mysqli_query($con, $sql);

    $votesql = "select username,votedto from `userdata` where votedto is NOT NULL order by votedto,votes;";
    $voteDet = mysqli_query($con, $votesql);

    if (mysqli_num_rows($resultgroup) > 0) {
        $groups = mysqli_fetch_all($resultgroup, MYSQLI_ASSOC);
        $_SESSION['groups'] = $groups;

        $groupvotedetails = mysqli_fetch_all($voteDet, MYSQLI_ASSOC);
        $_SESSION['groupvotedetails'] = $groupvotedetails;
    }
    $data = mysqli_fetch_array($result);
    $_SESSION['id'] = $data['id'];

    $_SESSION['data'] = $data;

    echo '<script>
    window.location="../partials/adminDash.php";
    </script>';
} else {
    echo '<script>
    alert("Invalid Credentials");
    window.location="../";
    </script>';
}
