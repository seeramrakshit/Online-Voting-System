<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting System -Registration page</title>
    <!-- paste bootsrap link from index.php -->
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body class="bg-dark" style="

background-image:url('../images/bc1.jpg');
background-repeat:no-repeat;
background-size:cover;

">
    <h1 class="text-center p-3">Voting System</h1>
    <div class=".bg-dark.br-gradient p-4 mx-auto rounded" style="width: 45%;">
        <h2 class="text-center">Register Account</h2>
        <div class="container text-center">
            <form action="../actions/register.php" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <input type="text" class="form-control w-50 m-auto" placeholder="Enter your userName" required="required" name="username">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control w-50 m-auto" placeholder="Enter your Mobile Number" required="required" name="mobile">
                </div>


                <div class="mb-3">
                    <input type="number" class="form-control w-50 m-auto" name="age" min="10" max="100" step="1"  required="required"  placeholder="Age">
                </div>



                <div class="mb-3">
                    <input type="password" class="form-control w-50 m-auto" placeholder="Enter your password" required="required" name="password">
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control w-50 m-auto" placeholder="confirm password" required="required" name="cpassword">
                </div>
                <div class="mb-3">
                    <input type="file" class="form-control w-50 m-auto" name="photo">
                </div>
                <div class="mb-3">
                    <select name="std" class="form-select w-50 m-auto">
                        <option value="group">Group</option>
                        <option value="voter">Voter</option>
                    </select>    
                </div>
                <button type="submit" class="btn btn-dark my-4">Register</button>
                <p>Already have an account? <a href="../index.php" class="text-white">Login here</a></p>
            </form>
        </div>
    </div>
</body>
</html>