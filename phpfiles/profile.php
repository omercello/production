<?php
     // Bu tek satırlık c++ tarzı açıklamadır
    /* Bu, C tarzı çok satırlı
       bir açıklamadır */
    
    /*
	$username=htmlentities($__REQUEST("username"));
	$password=htmlentities($__REQUEST("password"));
	$email=htmlentities($__REQUEST("email"));
	$name = htmlentities($__REQUEST("fullname"));


	if (empty($username) || empty($password) || empty($email) || empty($fullname)){


	    $returnArray["status"]="400";
	    $returnArray["message"]="Missing required information";

	    echo json_encode[$returnArray];
	    return;
	    echo 'Bu da sonuncusu'; # Bu tek satırlık kabuk tarzı açıklamadır
	*/
	
	
	/**
	  * Shortcut to username and password
	$username = $_POST['userName'];
	$password = $_POST['userPass'];
	$username = mehmet;
	$password = 123;
	
	
	*/
	
	$file = 'people.txt';
	
	$username = $_GET['userName'];
	$password = $_GET['userPass'];
	$email = $_GET['email'];
	
	///$data = 
	
	//echo $email
	file_put_contents($file, $username, FILE_APPEND);
	
	/**
	  * Connect to the database
	  * http://php.net/manual/en/mysqli.real-connect.php
	*/
	$user = 'root';
	$pass = 'root';
	$db   = 'couples';
	$host = 'localhost';
	$port = 8889;
	$link = mysqli_init();
	if (!$link) {
	    die('mysqli_init failed');
	}

	if (!$link->options(MYSQLI_INIT_COMMAND, 'SET AUTOCOMMIT = 0')) {
	    die('Setting MYSQLI_INIT_COMMAND failed');
	}

	if (!$link->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5)) {
	    die('Setting MYSQLI_OPT_CONNECT_TIMEOUT failed');
	}

	if (!$link->real_connect(
	  $host,
	  $user,
	  $pass,
	  $db
	)) {
	    die('Connect Error (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
	}

	// Quick test
	// echo 'Success... ' . $link->host_info . "\n";

	$connection = $link->real_connect(
	  $host,
	  $user,
	  $pass,
	  $db
	);

	/**
	  * More testing
	
$id = $_GET['id'];
  // do some validation here to ensure id is safe

  $link = mysql_connect("localhost", "root", "");
  mysql_select_db("dvddb");
  $sql = "SELECT dvdimage FROM dvd WHERE id=$id";
  $result = mysql_query("$sql");
  $row = mysql_fetch_assoc($result);
  mysql_close($link);

  header("Content-type: image/jpeg");
  echo $row['dvdimage'];
	*/
	// echo '$link: '; print_r($link); echo "\n";
	// echo '$connection: '; print($connection); echo "\n";
	// echo '$connection _r: '; print_r($connection); echo "\n";

	if (!$connection) {
	  die('Database connection failed.');
	}

	/**
	  * Insert data into table
	*/
	$query  = "SELECT image FROM Users WHERE userName=$username and userPass=$password";
	header("Content-type: image/jpeg");
	//$query .= "VALUES ('$username', '$password')";

	// $result = mysqli_query($connection, $query);
	$result = mysqli_query($link, $query);

	if (!$result) {
	  die('Error: ' . mysqli_error($link));
	}

	/**
	  * Close connection
	*/
	$link->close();
	
?>