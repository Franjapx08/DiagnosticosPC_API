<?php
   include_once('../controllers/Usuarios.php');
    $Usuarios = new Usuarios();
    $datos = $Usuarios->getTecnicosActivos();
   echo json_encode($datos, JSON_UNESCAPED_UNICODE);
     