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

        function agregarDiagnostico($tipo, $marca, $modelo, $noSerie, $observaciones, $reporteFall, $fechaIngreso, $horaIngreso, $fechaPrometida, $horaPrometida, $tecnico, $cliente){
            $result = $this->conexion->runQuery("INSERT INTO `Producto` (`id`, `Tipo`, `Marca`, `Modelo`, `NoSerie`, `Observacion`, 
            `ReporteFalla`, `FechaIngreso`, `HoraIngreso`, `FechaPrometida`, `HoraPrometida`, `estatus`, `estatus_act`, `Usuarios_id`, `Clientes_id`) 
            VALUES (NULL, '".$tipo."', '".$marca."', '".$modelo."', '".$noSerie."', '".$observaciones."', 
            '".$reporteFall."', '".$fechaIngreso."', '".$horaIngreso."', '".$fechaPrometida."', '".$horaPrometida."', '0', '0', '".$tecnico."', '".$cliente."');");
            return $result;
        }

    }
