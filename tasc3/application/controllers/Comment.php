<?php

    class Comment extends CI_Controller {

        public function __construct() 
        {
            parent::__construct();
            $this->load->model('comment_model');
            $this->load->library('pagination');
            $this->load->helper('url');
        }

        public function index() {
            $params = [];
            $limit_per_page = 5;
            $start_index = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;
            $total_records = $this->comment_model->get_total();

            $this->load->helper('url');
            $this->load -> helper(array ('form' , 'url')); 

            $this->load->library('form_validation');

            $this->form_validation->set_rules("name", "Name", "trim|max_length[20]");
            $this->form_validation->set_rules("email", "Email", "required|trim|valid_email");
            $this->form_validation->set_rules("comment", "Comments", "required|trim|max_length[150]");
            
            if ($this->form_validation->run() == true) {
                $this->comment_model->insert_entry($this->input->post());
            }
                
            if ($total_records > 0) 
            {
                // get current page records
                $params["results"] = $this->comment_model->get_current_page_records($limit_per_page, $start_index);
                 
                $config['base_url'] = '/comment/index';
                $config['total_rows'] = $total_records;
                $config['per_page'] = $limit_per_page;
                $config["uri_segment"] = 3;
                 
                $this->pagination->initialize($config);
                 
                // build paging links
                $params["links"] = $this->pagination->create_links();
            }

            //var_dump($params); die();
            $this->load->view('comment/create_comments', $params);
        }

        public function create() {
            $this->load->helper('url');
            $this->load -> helper(array ('form' , 'url')); 

            $this->load->library('form_validation');

            $this->form_validation->set_rules("name", "User", "required | trim | alpha | max_lenght[20]");
            $this->form_validation->set_rules("email", "Email", "required | trim  | valid_email");
            $this->form_validation->set_rules("comment", "Comments", "required | trim  | max_lenght[150]");
            
            if ($this->form_validation->run() == FALSE) {
                return $this->load->view('comment/create_comments');
            } else {
                echo "Validation True";
                return;
            }

            //$this->load->view('formsuccess');

            if($_POST) {
                $this->comment_model->insert_entry($_POST);
            }
            redirect('http://codeigniter3-example/comment/index'); 
        }

    }
?>