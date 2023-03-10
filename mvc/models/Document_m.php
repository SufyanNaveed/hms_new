<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Document_m extends MY_Model {

    protected $_table_name = 'document';
    protected $_primary_key = 'documentID';
    protected $_primary_filter = 'intval';
    protected $_order_by = "documentID desc";

    function __construct() {
        parent::__construct();
    }

    function get_document($array=NULL, $signal=FALSE) {
        $query = parent::get($array, $signal);
        return $query;
    }

    function get_order_by_document($array=NULL) {
        $query = parent::get_order_by($array);
        return $query;
    }

    function get_single_document($array) {
        $query = parent::get_single($array);
        return $query;
    }

    function insert_document($array) {
        $error = parent::insert($array);
        return TRUE;
    }

    function update_document($data, $id = NULL) {
        parent::update($data, $id);
        return $id;
    }

    public function delete_document($id){
        parent::delete($id);
    }
}