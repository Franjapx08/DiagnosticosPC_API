<?php
  session_start();
  if(isset($_SESSION["user"])){

    $data = array(
         'code' => 1,
         'data' => $_SESSION["user"], 
         );
  }else{
    $data = array(
         'code' => 2,
         'data' => 'No datos', 
         );
  }
echo(json_encode($data));