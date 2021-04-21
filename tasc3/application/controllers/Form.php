<?php 

class Form extends CI_Controller {

    public function index()
    {
        $this->load -> helper(array ('form' , 'url')); 
        //$this->load->helper('create_comments');
        $this->load->library('form_validation');

        $this->form_validation->set_rules("name", "User", "required | trim | alpha | max_lenght[20]");
        $this->form_validation->set_rules("email", "Email", "required | trim  | valid_email");
        $this->form_validation->set_rules("comment", "Comments", "required | trim  | max_lenght[150]");

        if ($this->form_validation->run() == FALSE)
        {
            $this->load->view('create_comments');
        }
        else
        {
            echo "Validation True";
        }
        $this->load->view('formsuccess');
    }
}