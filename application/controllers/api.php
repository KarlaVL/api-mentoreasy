<?php

//defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require APPPATH . 'libraries/REST_Controller_Definitions.php';

class Api extends REST_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Api_model');
    }

    public function login_post() {
        
        $username = $this->post('username');
        $password = $this->post('password');
        
        $invalidLogin = array ('invalid' => $username,
                               'status' => false);
        
        if(!$username || !$password) $this->response($username, REST_Controller::HTTP_NOT_FOUND);
        
        $id = $this->Api_model->login($username,$password);
        $nu_rol = $this->Api_model->rol($id);
        $name = $this->Api_model->nombre($id);
        $carrera = $this->Api_model->carrera($id);
        
        if($id) {
            
            $valid = array ('id' => $id,
                            'username' => $username,
                            'rol' => $nu_rol,
                            'nombre' => $name,
                            'carrera' => $carrera,
                            'token' => $token = bin2hex(random_bytes(8)));
            
            $this->set_response($valid, REST_Controller::HTTP_OK);
        }
        else {
            $this->set_response($invalidLogin, REST_Controller::HTTP_NOT_FOUND);
        }
    }

      public function registro_post()
    {
        header("Access-Control-Allow-Origin: *");
        $_POST = json_decode($this->security->xss_clean(file_get_contents("php://input")),true);
        
        $input = $this->input->post();
        $this->db->insert('usuarios_mts',$input);
     
        $this->response(['Usuario creado'], REST_Controller::HTTP_OK);
    }

    public function solicitud_post()
    {
        header("Access-Control-Allow-Origin: *");
        $_POST = json_decode($this->security->xss_clean(file_get_contents("php://input")),true);
        
        $input = $this->input->post();
        $this->db->insert('solicitudes_mts',$input);
     
        $this->response(['Solicitud enviada'], REST_Controller::HTTP_OK);
    }

    public function solicitudadmin_get($carrera)
    {
        header("Access-Control-Allow-Origin: *");
        $_POST = json_decode($this->security->xss_clean(file_get_contents("php://input")),true);
       // urldecode($carrera);
        $solicitudes = $this->Api_model->admin(urldecode($carrera));
        
        if(!is_null($solicitudes)){
            $this->response($solicitudes, 200);
        } else {
            $this->response(array('error' => 'No hay solicitudes'), 404);
        }
    }

    public function vermentores_get($carrera, $asignatura)
    {
        header("Access-Control-Allow-Origin: *");
        $_POST = json_decode($this->security->xss_clean(file_get_contents("php://input")),true);
        //urldecode($carrera);
        $vermentores = $this->Api_model->vermentor(urldecode($carrera), urldecode($asignatura));
        
        if(!is_null($vermentores)){
            $this->response($vermentores, 200);
        } else {
            $this->response(array('error' => 'No hay mentores'), 404);
        }
    }

    public function asignarmentor_put($id)

    {
        header("Access-Control-Allow-Origin: *");
        $_POST = json_decode($this->security->xss_clean(file_get_contents("php://input")),true);
        
        $input = $this->input->post();
        $this->db->set($input);
        $this->db->update('solicitudes_mts', $input, array('id_solicitudes'=>$id));
		
        $this->response(['Mentor asignado'], REST_Controller::HTTP_OK);
    }

    

}
