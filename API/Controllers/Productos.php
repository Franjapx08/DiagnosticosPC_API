<?php
    include_once('Conection.php');
    
    Class Productos {
        private $conexion;

        public function __construct() {
            $this->conexion = new Conexion();
        }
       
        function getProductosActivos() {
            $result = $this->conexion->getQuery("SELECT * FROM Producto
            WHERE estatus = 0;");
            return $result;
        }

    }
