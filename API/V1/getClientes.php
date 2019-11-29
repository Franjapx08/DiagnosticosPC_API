<?php
   include_once('../controllers/Clientes.php');
    $Clientes = new Clientes();
    $datos = $Clientes->getClientesActivos();
   echo json_encode($datos, JSON_UNESCAPED_UNICODE);
     