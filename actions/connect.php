<?php

$con=mysqli_connect("localhost","root","","onlineVoting");
if(!$con){
    die(mysqli_error(mysqli_connect("localhost","root","","onlineVoting")));
}
