<!DOCTYPE html>
<html>
<?php 
	session_start();

	//open database
	require_once 'includes/db_connect.php';
	require_once 'includes/functions.php';

	if (!logged_in()) {
  		header("Location: index.php");
	}
	  

	//write_to_file($_SESSION, "Session Variables");

	$studentMajor = $_SESSION['major'];
	if ($studentMajor == 'CS') {
		$studentMajor = "Computer Science";
	}
	elseif ($studentMajor == 'CIS') {
		$studentMajor = "Computer Information Systems";
	}

	//write_to_file($studentMajor, "\$studentMajor");

?>

<head>
	<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=de c vice-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Course Recommend</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
<?php include('includes/header.php');?>
<?php include('includes/menubar.php');?>


<nav class="navbar navbar-default navbar-custom">
  <div class="container-fluid"> 
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"></button>
      <a class="navbar-brand"> <?php echo $studentMajor; ?> </a>
    </div>
	  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    <ul class="nav navbar-nav">
          <li> </li>
          <li> </li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a class="text-primary">
	        <?php	
	        	echo $_SESSION['fname'];
	        	echo " ";
				echo $_SESSION['lname']; 
			?>
	      </a></li>
	      <li>&nbsp;</li>
        <li><a><?php echo $_SESSION['studentid']; ?></a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- the table -->
<div class="container">
  <div class="row extra-top">
    <div class="col-lg-12">
      <div class="jumbotron">
	  		<div class="panel panel-default">
			    <table class="table">
			    <tr> <!-- Set table headers -->
			    <?php $startyear = $_SESSION['startyear']; ?>
                    <th class="table-title">Year</th>
				    <th colspan="2"></th>
				    <?php for($x = 0; $x < 5; $x++){ ?>
			    	<th colspan="3"><center><?php echo $startyear + $x ?></center></th>
			    	<?php } ?>
				    <th></th>
				</tr>
				  	<tr>
					    <th class="className table-title">Class Name</th>
					    <th class="table-title">ID</th>
					    <th class="table-title">Credit Hours</th>
					    <?php for($x = 0; $x < 5; $x++){ ?>
						    <th class="term-width">F</th>
						    <th class="term-width">S</th>
						    <th class="term-width"><i class="fa fa-sun-o"></i></th>
					    <?php } ?>
					    <th class="table-title">Grade</th>
				  	</tr>

				  	<!-- Fill out form body -->
					<?php

					$sql_coursemajor = "SELECT * 
						FROM courses JOIN major 
						ON courses.courseid = major.courseid 
						WHERE majorid = ?;";

					$sql_coursemajor = $connection->prepare($sql_coursemajor);
					$sql_coursemajor->bind_param('s', $_SESSION['major']);
					$sql_coursemajor->execute();

					$result = $sql_coursemajor->get_result();

					//takes every courseid with correct major

					$takenspace = null;
					$status = 0;
					
					while ($row = $result->fetch_array()) {

						//check if course has been taken
						$grade = "";
						$courseid = $row['courseid'];
						$findCourseTakenSql = " SELECT * 
												FROM ( 
													SELECT courseid, grade, termtaken, status 
													FROM studentcourse JOIN student 
													ON studentcourse.studentid = student.studentid 
													where student.studentid = ?
												) as courseHistory 
												where courseid = ?";
						
						$courseTakenStmt = $connection->prepare($findCourseTakenSql);
						$courseTakenStmt->bind_param('ss', $_SESSION['studentid'], $courseid);
						$courseTakenStmt->execute();

						$courseTaken = $courseTakenStmt->get_result();

						if($taken = $courseTaken->fetch_assoc()){
							//write_to_file($taken, "\$taken");
							$year = substr($taken['termtaken'], 3,1);
							$term = substr($taken['termtaken'], 4,1);
							//years off start date (0 = start year)
							$remain = $year;
                            $remain = $year - $_SESSION['startyear'];
							$remain = $remain * 3;

							$termpos = 0;
							if ($term == 7){
								// 7 represents Fall
								// Fall is in position 1
								$termpos = 1;
							} elseif ($term == 1){
								// 1 Represents Spring
								// Spring is in position 2
								$termpos = 2;
							} elseif ($term == 4){
								// 4 represents Summer
								// Summer is in position 3
								$termpos = 3;
							}

							//spaces form base (3)
							$takenspace = $remain + $termpos;
                            $takenspace = $year * 3 +$termpos;

							$grade = $taken['grade'];
							$status = $taken['status'];
						}

						?>

						<tr> 
							<td class="className table-title"> <?php echo $row['classname']; ?> </td>
							<td class="table-title"> <?php echo $row['courseid']; ?> </td> 
							<td class="table-title"> <?php echo $row['units']; ?> </td> 
							<?php
								//break up terms
								$termnum = $row['term'];
								$fall = substr($termnum, 0,1);
								$spring = substr($termnum, 1,1);
								$summer = substr($termnum, 2,1);

							$currentTerm = "fall";
							for ($i=1; $i <= 15; $i++) { 
								switch ($currentTerm) {
									case "fall":
                                        if (validate_term($fall, $takenspace, $i, $status) == "taken") {
											?><td style="background-color:yellow;"></td><?php
										} elseif (validate_term($fall, $takenspace, $i, $status) == "failed") {
											?><td>F</td><?php
										} elseif (validate_term($fall, $takenspace, $i, $status) == "planned") {
											?><td style="background-color: blue;">ADV</td><?php
										} elseif (validate_term($fall, $takenspace, $i, $status) == "progress") {
											?><td>IP</td><?php
										} elseif (validate_term($fall, $takenspace, $i, $status) == "available") {
											?><td style="background-color:green;"></td><?php
										} else {
											?><td style="background-color:red;"></td><?php
										}
										break;
									case "spring":
										if (validate_term($spring, $takenspace, $i, $status) == "taken") {
											?><td style="background-color:yellow;"></td><?php
										} elseif (validate_term($spring, $takenspace, $i, $status) == "failed") {
											?><td>F</td><?php
										} elseif (validate_term($fall, $takenspace, $i, $status) == "planned") {
											?><td style="background-color: blue;">ADV</td><?php
										} elseif (validate_term($spring, $takenspace, $i, $status) == "progress") {
											?><td>IP</td><?php
										} elseif (validate_term($spring, $takenspace, $i, $status) == "available") {
											?><td style="background-color:green;"></td><?php
										} else {
											?><td style="background-color:red;"></td><?php
										}
										break;
									case "summer":
										if (validate_term($summer, $takenspace, $i, $status) == "taken") {
											?><td style="background-color:yellow;"></td><?php
										} elseif (validate_term($summer, $takenspace, $i, $status) == "failed") {
											?><td>F</td><?php
										} elseif (validate_term($fall, $takenspace, $i, $status) == "planned") {
											?><td style="background-color: blue;">ADV</td><?php
										} elseif (validate_term($summer, $takenspace, $i, $status) == "progress") {
											?><td>IP</td><?php
										} elseif (validate_term($summer, $takenspace, $i, $status) == "available") {
											?><td style="background-color:green;"></td>><?php
										} else {
											?><td style="background-color:red;"></td><?php
										}
										break;
								}

								// Cycle through the terms
								if ($currentTerm == "fall") {
									$currentTerm = "spring";
								} elseif ($currentTerm == "spring") {
									$currentTerm = "summer";
								} elseif ($currentTerm == "summer") {
									$currentTerm = "fall";
								}
							}

							$takenspace = 0; ?>
							<!-- end replication -->

							<td><?php echo $grade; ?></td> 
						</tr> 
						<?php
					} // End of row, loop through again until end of table! ?>
					</table>
				</div>
				<center><a href="includes/logout.php">Logout</a></center>
	  	</div>
	</div>
  </div>
</div> 

<?php
  $connection->close();
?>

<!-- include footer -->
<center>
  <?php include 'footer.php'; ?>
</center>
</body>
</html>