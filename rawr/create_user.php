
<?php

/*
 * Following code will create a new product row
 * All product details are read from HTTP Post Request
 */

 $servername = "127.0.0.1";
 $username = "root";
 $password = "tgisispuj";
 $dbname = "rawrdb";


 // Create connection
 $conn = new mysqli($servername, $username, $password, $dbname);
 $conn->set_charset('utf8');

 if ($conn->connect_error) {
     echo "error de coneción";
     die("Connection failed: " . $conn->connect_error);
 }



    $username = $_POST['username'];
    $password = $_POST['password'];
    echo $username;
    $sql = "INSERT INTO Usuario (user, password) VALUES ('$username', '$password')";
    if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    // mysql inserting a new row
    //$result = mysql_query("INSERT INTO Usuario(user, password)
      //                            VALUES('$username', '$password')");
    //echo $result;
    // check if row inserted or not

?>
