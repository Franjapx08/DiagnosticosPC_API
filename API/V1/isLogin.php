<?php
  session_start();
  echo isset($_SESSION["user"])
  ? json_encode(  $data = array("isLogin" => true))
  : json_encode(  $data = array("isLogin" => false));

    