<?php

class Api_model extends CI_Model {
    
    public function __construct() {
        Parent::__construct();
    }
    
    public function login($username, $password) {
                $this->db->where('username',$username);
                $this->db->where('password',$password);
		$query = $this->db->get('usuarios_mts');
        if ($query->num_rows() == 1) {
            $result = $query->result();
            return $result[0]->id_user;
            //return $query->row();
        }
        return false;
    }
    
    public function rol($id) {
                $this->db->select('tipo_user');
                $this->db->from('usuarios_mts');
                $this->db->where('id_user',$id);
		$query = $this->db->get();
        if ($query->num_rows() == 1) {
            $result = $query->result();
            return $result[0]->tipo_user;
            //return $query->row();
        }
        return false;
    }

    public function nombre($id) {
                $this->db->select('nombre');
                $this->db->from('usuarios_mts');
                $this->db->where('id_user',$id);
        $query = $this->db->get();
        if ($query->num_rows() == 1) {
            $result = $query->result();
            return $result[0]->nombre;
            //return $query->row();
        }
        return false;
    }

    public function carrera($id) {
                $this->db->select('carrera');
                $this->db->from('usuarios_mts');
                $this->db->where('id_user',$id);
        $query = $this->db->get();
        if ($query->num_rows() == 1) {
            $result = $query->result();
            return $result[0]->carrera;
            //return $query->row();
        }
        return false;
    }

        public function admin($carrera) {
        
            if(!is_null($carrera)){
            $this->db->select('s.id_solicitudes, u.nombre, s.situacion, s.asignatura, s.tema, s.promedio_inicial, u.grupo, s.nu_mentorado, s.status_envio');
            $this->db->from('solicitudes_mts as s');
            $this->db->join('usuarios_mts as u' , 's.nu_mentorado=u.id_user');
            $this->db->where('s.status_envio', "0");
            $this->db->where('u.carrera', $carrera);
            $query = $this->db->get();
            
                if ($query->num_rows() > 0){
                return $query->result_array();
                }   
 
            }
        }

        public function vermentor($carrera, $asignatura) {
        
            if(!is_null($carrera)){
            $this->db->select('usuarios_mts.id_user, usuarios_mts.nombre');
            $this->db->from('materias_user_mts');
            $this->db->join('usuarios_mts' , 'materias_user_mts.id_mentor = usuarios_mts.id_user');
            $this->db->where('usuarios_mts.tipo_user' , "Mentor");
            $this->db->where('usuarios_mts.carrera', $carrera);
            $this->db->where('materias_user_mts.asignatura', $asignatura);
            $query = $this->db->get();
            
                if ($query->num_rows() > 0){
                return $query->result_array();
                }   
 
            }
        }

        public function mentor($id) {
        
            if(!is_null($id)){
            $this->db->select('s.id_solicitudes, u.nombre, s.situacion, s.asignatura, s.tema, s.promedio_inicial, u.grupo, s.nu_mentorado, s.status_envio');
            $this->db->from('solicitudes_mts as s');
            $this->db->join('usuarios_mts as u' , 's.nu_mentorado=u.id_user');
            $this->db->where('s.nu_mentor', $id);
            $query = $this->db->get();
            
                if ($query->num_rows() > 0){
                return $query->result_array();
                }   
 
            }
        }

}