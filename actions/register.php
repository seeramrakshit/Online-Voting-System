<?php
include('connect.php');

$username=$_POST['username'];
$mobile=$_POST['mobile'];
$passowrd=$_POST['password'];
$cpassword=$_POST['cpassword'];
$image=$_FILES['photo']['name'];
$tmp_name=$_FILES['photo']['tmp_name'];
$std=$_POST['std'];
$age=$_POST['age'];


if($passowrd!=$cpassword){
    echo '<script>
    alert("Passwords did not match");
    window.location="../partials/registration.php";
    </script>';
}


elseif($age<18){
   echo'<script>
   alert("Age not satisfied");
   window.location="../partials/registration.php";
   </script>';
}

else{
     move_uploaded_file($tmp_name,"../uploads/$image");
     $sql="insert into `userdata` (username,mobile,password,photo,standard,status,votes,age) values ('$username','$mobile','$passowrd','$image','$std',0,0,'$age')";

     $result=mysqli_query($con,$sql);

     if($result){
        echo '<script>
        alert("Registration successfull");
        window.location="../index.php";
        </script>';
     }
     else{
        die(mysqli_error($con));
     }
}
