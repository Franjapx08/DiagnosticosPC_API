<?php
   include_once('../controllers/Productos.php');
    $Productos = new Productos();
    $datos = $Productos->getProductosActivos();
   echo json_encode($datos, JSON_UNESCAPED_UNICODE);
     