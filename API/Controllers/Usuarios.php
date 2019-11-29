<?php
    include_once('Conection.php');
    
    Class Usuarios {
        private $conexion;

        public function __construct() {
            $this->conexion = new Conexion();
        }
       
        function loginUsuarios($correo, $password) {
            $result = $this->conexion->getQuery("SELECT * FROM Usuarios
            WHERE estatus = 0 AND email = '".$correo."' AND password = '".$password."';");
            return $result;
        }

        function getTecnicosActivos() {
            $result = $this->conexion->getQuery("SELECT u.id, u.email , u.nombre 
            ,concat_ws(' - ', nombre, email) AS text  FROM Usuarios u
            WHERE u.estatus = 0;");
            return $result;
        }

    }
