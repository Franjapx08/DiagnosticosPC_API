<?php
    include_once('Conection.php');
    
    Class Clientes {
        private $conexion;

        public function __construct() {
            $this->conexion = new Conexion();
        }
       
        function getClientesActivos() {
            $result = $this->conexion->getQuery("SELECT c.id, c.email, c.celular, c.Referencia , c.Nombre 
            ,concat_ws(' - ', nombre, email) AS text  FROM Clientes c
            WHERE c.estatus = 0;");
            return $result;
        }

    }
