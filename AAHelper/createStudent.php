<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Create Student</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
<body>
    <?php
    // Database information
    require_once 'includes/db_connect.php';

    // POST variables
    $studentid = $_POST['studid'];
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $email = $_POST['email'];
    $password = hash('SHA512', $_POST['password']);
    $major = $_POST['major'];
    $startyear = $_POST['startyear'];
    $advid = $_POST['advisor'];
    
    if (isset($_POST['transferred'])) {
        $transferred = $_POST['transferred']; // This is an array of classes
    }

    $newStudent = "INSERT INTO student (studentid, fname, lname, email, password, major, startyear, advid) 
            VALUES ('$studentid', '$fname', '$lname', '$email', '$password', '$major', '$startyear', '$advid')";
    
    if ($connection->query($newStudent) == TRUE) {
        if (isset($transferred) && !empty($transferred)) {
            foreach ($transferred as $transferredClass) {
                $sql = "INSERT INTO studentcourse (studentid, courseid, grade, termtaken, status)
                        VALUES ('$studentid', '$transferredClass', 'T', '11111', 'T')";
                $connection->query($sql);
            }
        } ?>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4 text-center">
                    <h2 class='success'>&#x2713; New Student Added Successfully!</h2>
                    <p>Click <a href='index.php'>here</a> to login to your new account!</p>
                </div>
                <div class="col-md-4">
                </div>
            </div>  
        </div>
    <?php } else { ?>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4 text-center">
                    <h2 class='error'>&#x2717; Uh-oh! There was an error adding the student!</h2>
                    <p>Error: <?php echo $connection->error ?> </p>
                    <p>Click <a href='index.php'>here</a> to try again</p>
                </div>
                <div class="col-md-4">
                </div>
            </div>  
        </div>
    <?php }

    $connection->close();
    ?>
    <!-- include footer -->
    <div class="row text-center extra-top">
        <?php include_once "footer.php" ?>
    </div>
</body>
</html>