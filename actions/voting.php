<?php
session_start();
include('connect.php');

$votes = $_POST['groupvotes'];
$totalvotes = $votes + 1;
$votedbyy = $_POST['votedby'];
$votedtoo = $_POST['votedto'];


$gid = $_POST['groupid'];
$uid = $_SESSION['id'];

$updatevotes = mysqli_query($con, "update `userdata` set votes='$totalvotes' where id='$gid'");
$updatevotedto = mysqli_query($con, "update `userdata` set votedto='$votedtoo' where username='$votedbyy'");
$updatstatus = mysqli_query($con, "update `userdata` set status=1 where id='$uid'");

if ($updatevotes and $updatstatus) {
    $getgroups = mysqli_query($con, "select username,photo,votes,id,votedto from `userdata` where standard='group'");
    $groups = mysqli_fetch_all($getgroups, MYSQLI_ASSOC);
    $_SESSION['groups'] = $groups;
    $_SESSION['status'] = 1;
    echo '<script>
    alert("Voting successfull");
    window.location="../partials/dashboard.php";

    </script>';
} else {
    echo '<script>
    alert("Technical error!! vote after sometime");
    window.location="../partials/dashboard.php";

    </script>';
}
