<!DOCTYPE html>
<?php 
	session_start();

	//open database
	require_once 'includes/db_connect.php';
	require_once 'includes/functions.php';
if (!logged_in()) {
  		header("Location: index.php");
	}
?>
<html>
<head>
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title><?php echo $_SESSION['fname'] . " " . $_SESSION['lname'] ?> | Home</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>>

    
</head>
<body> 
<?php include('includes/header.php');?>
<?php include('includes/menubar.php');?>
  <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line"> Welcome <?php echo $_SESSION['fname'] . " " . $_SESSION['lname'] ?> </h4>

                </div>
  <div class="container">
            <div class="row">
                <h2 class="title text-center">Please select an option from the menu bar to continue</h2>
            </div>