<?php
    include_once('../controllers/Productos.php');
    if(isset($_POST['hora']) && isset($_POST['fecha']) && isset($_POST['tipoEquipo']) && isset($_POST['marca']) && isset($_POST['modelo']) &&
    isset($_POST['noSerie']) && isset($_POST['falla']) && isset($_POST['accesorios']) && isset($_POST['fechaPrometida']) && 
    isset($_POST['tecnico']) &&  isset($_POST['cliente'])){
        $coti = new Productos();
        $r = $coti->agregarDiagnostico($_POST['tipoEquipo'], $_POST['marca'], $_POST['modelo'], $_POST['noSerie'], $_POST['accesorios'], $_POST['falla'], 
        $_POST['fecha'], $_POST['hora'], $_POST['fechaPrometida'], $_POST['horaPrometida'], $_POST['tecnico'], $_POST['cliente']);
         $data = array(
            'code' => 1,
            'message' => 'Éxito'
            );
    }else{
        echo 'faltan parametros .Error';
    }
    echo(json_encode($data));

