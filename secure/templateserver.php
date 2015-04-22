<?php
session_start();
$checkVar = true;
/**
 * Including all required files and libraries
 * that might be required for operation
 */
include '../config/config.php';
include '../libs/error.php';
include '../libs/db.php';
include '../libs/log.php';
include '../libs/access.php';
include '../libs/login.php';

/**
 * Code to authenticate the admin
 * from existing data in session
 */
include 'authentication.php';

/**
 * including other libraries
 * now that user is authenticated
 */

include '../libs/subscriber.php';
include '../libs/groups.php';
include '../libs/mail.php';


/**
 * Considering: database is still connected
 */

/**
 * including file to do all CSQ operation
 * we are sure CSQ exists in this page as
 * a $_POST data
 */

if(isset($_POST['json']) && !empty($_POST['json'])){
    $json = json_decode($_POST['json'], true);

    if($json['task'] == "ADD_TEMPLATE"){
        $params = array();
        if( preg_match_all("/{{@([a-zA-Z0-9.-]+)}}/", $json['body'], $params) > 0) 
            $params = $params[1];
        
        $q = mysql_query("INSERT INTO `template`( `name`, `content`) VALUES ('$json[name]','$json[body]') ");
        if(!$q) exit(mysql_error());
        $temp_id = mysql_insert_id();

        foreach ($params as $key => $value) {
            $qp = mysql_query("INSERT INTO `template_parameter`(`template_id`, `name`) VALUES ('$temp_id','$value')"); 
            if(!$qp) exit(mysql_error());  
        }
    }

    
}


dbase::close_connection();
