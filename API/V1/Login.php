<?php
      if(isset($_POST['email']) && isset($_POST['password'])){
        include_once('../controllers/Usuarios.php');
        $usuario = new Usuarios();
        $result = $usuario->loginUsuarios($_POST['email'], sha1($_POST['password']));
        if(sizeof($result)!=0){   
            //$idUs = $result[0]['id'];
            session_start();
            $_SESSION["user"] = $result[0];
            $data = array(
                'code' => 1,
                'data' => $result[0],
                'message' => 'Usuario logeado con éxito'
            );
        }else{ 
            $data = array(
                'code' => -1,
                'message' => 'Error al encontrar el usuario'
                );
        }
    }else {
        $data = array(
            'code' => -1,
            'data' => array(),
            'message' => 'Error al enviar datos.'
        );
    }
echo(json_encode($data));