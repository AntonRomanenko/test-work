<?php

class Comment_model extends CI_Model {

    public function __construct()
    {
        $this->load->database();
    }

    public function getComments() {

        $query = $this->db->get('comment');

        return $query->result_array();
    }

    public function get_current_page_records($limit, $start) 
    {
        $this->db->limit($limit, $start);
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get("comment");
 
        if ($query->num_rows() > 0) 
        {
            foreach ($query->result() as $row) 
            {
                $data[] = $row;
            }
             
            return $data;
        }

        return false;
    }

    public function insert_entry($data)
    {
        if($data['name'] == '') {
            $data['name'] = stristr($data['email'], '@', true);
        }
        $this->db->insert('comment', $data);
    }
 
        

    public function get_total() 
    {
        return $this->db->count_all("comment");
    }

}