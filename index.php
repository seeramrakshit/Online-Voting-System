<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Voting System</title>
    <!-- Bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">




</head>

<body class="bg-dark" style="

background: rgb(63,94,251);
background: radial-gradient(circle, rgba(63,94,251,1) 32%, rgba(65,134,251,1) 57%, rgba(66,154,251,1) 74%, rgba(70,224,252,1) 90%);

background: rgb(65,134,251);
background: radial-gradient(circle, rgba(65,134,251,1) 8%, rgba(66,154,251,1) 43%, rgba(70,224,252,1) 69%, rgba(251,63,222,1) 98%);

background: rgb(131,58,180);
background: linear-gradient(90deg, rgba(131,58,180,1) 3%, rgba(170,49,132,1) 34%, rgba(253,29,29,1) 62%, rgba(252,176,69,1) 100%);

/* background: rgb(215,53,124);
background: radial-gradient(circle, rgba(215,53,124,1) 0%, rgba(220,198,51,1) 39%, rgba(51,220,59,1) 60%, rgba(215,15,15,1) 89%, rgba(228,24,24,1) 100%); */

background-image:url('./images/bc1.jpg');
background-repeat:no-repeat;
background-size:cover;

">
    <h1 class="text-center p-3" style="color:black;">VOTING SYSTEM</h1>
    <div class=".bg-dark.br-gradient p-4 mx-auto rounded" style="width: 45%;">
        <h2 class="text-center">Login</h2>
        <div class="container text-center">
            <form action="./actions/login.php" method="POST">
                <div class="mb-3">
                    <input type="text" class="form-control w-50 m-auto" name="username" placeholder="Enter your Username" require="required">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control w-50 m-auto" name="mobile" placeholder="Enter your Mobile Number" require="required" maxLength="10" minLength="10">
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control w-50 m-auto" name="password" placeholder="Enter your password" require="required">
                </div>
                <div class="mb-3">
                    <select name="std" class="form-select w-50 m-auto">
                        <option value="group">Group</option>
                        <option value="voter">Voter</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-dark my-4">Login</button>
                <p>Dont Have an account? <a href="./partials/registration.php" class="text-white"> Register Here</a></p>

            </form>
            <p>For Admin <a href="./partials/adminIndex.php" class="text-white"> Login Here</a></p>

        </div>
    </div>

</body>

</html>