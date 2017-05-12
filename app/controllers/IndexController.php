<?php
use Phalcon\Mvc\View;
use Phalcon\Mvc\Controller;
use Phalcon\Session\Adapter\Files as SessionAdapter;


class IndexController extends ControllerBase
{

    public function initialize()
    {
        // if (empty($this->session->get('uid'))) {
        //     $this->response->redirect('account/loginEnd');
        // }
    }

    public function sessionLoginJenisAction($value='')
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        if (empty($this->session->get('id_jenis'))) {
            $data['session'] = 'false';
            $data['id_jenis'] = $this->session->get('id_jenis');
            echo json_encode($data);
        }else{
            $data['session'] = 'true';
            $data['id_jenis'] = $this->session->get('id_jenis');
            echo json_encode($data);
        }
    }

    public function psAreaAction($value='')
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        if (empty($this->session->get('id_jenis'))) {
            $data['session'] = 'false';
            $data['id_jenis'] = $this->session->get('id_jenis');
            echo json_encode($data);
        }else{
            $data['session'] = 'true';
            $data['id_jenis'] = $this->session->get('id_jenis');
            echo json_encode($data);
        }
    }

    public function cekSessionAction($value='')
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        if (empty($this->session->get('uid'))) {
            $data['session'] = 'false';
            $data['uid'] = $this->session->get('uid');
            echo json_encode($data);
        }else{
            $data['session'] = 'true';
            $data['uid'] = $this->session->get('uid');
            echo json_encode($data);
        }
    }

    public function indexAction()
    {
        // echo "<pre>".print_r($this->session->get('usergroup'),1)."</pre>";die();

        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/login');
        }else{
            $this->view->menu=$this->menuAction();
        }
        
        // $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }


    public function index2Action()
    {

        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }else{
            $this->view->menu=$this->menuAction();
        }
        
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }



///////////////////////////////////////////////////
/////////////MENU PEGAWAI ST//////////////////
////////////////////////////////////////////////


    
    public function menuAction(){

        $usergroup = $this->session->get('usergroup');
        if (!empty($usergroup)) {
            $ug_arr=explode(",",$usergroup);
            foreach ($ug_arr as $k => $v) {
                if ($v!='') {
                    $ug_sql[]="usergroup_id like '%,$v,%'";
                }
            }
        }
        $ug_sql_string=implode(" or ",$ug_sql);
        
        $phql = "SELECT id,controller,parent,action,label_menu,icon,child from Acl where parent = '0' and aktif = 'Y' and ($ug_sql_string) ";
        $query = $this->modelsManager->executeQuery($phql)->toArray();


        foreach ($query as $key => $value) {

            $query2 = '';
            if ($value['child'] != '') {
                $id = $value['id'];
                $phql2  = "SELECT id,controller,parent,action,label_menu,icon,child from Acl where parent = '$id' and aktif = 'Y' and ($ug_sql_string)";
                $query2 = $this->cek_anak($phql2,$ug_sql_string);
            }

            $dt[] = array(
                'id' => $value['id'], 
                'controller' => $value['controller'], 
                'action' => $value['action'], 
                'label_menu' => $value['label_menu'], 
                'icon' => $value['icon'], 
                'child' => $query2, 

            );
        }
        return $dt;      
    }

    public function cek_anak($phql2,$ug_sql_string)
    {
        
        $query2 = $this->modelsManager->executeQuery($phql2)->toArray();

        foreach ($query2 as $key2 => $value2) {
            $n = '';
            if ($value2['child'] != '') {
                $q = $value2['id'];
                $asd  = "SELECT id,controller,parent,action,label_menu,icon,child from Acl where parent = '$q' and aktif = 'Y'";
                $n = $this->cek_anak($asd,$ug_sql_string);
            }

            $as[] = array(
                'id' => $value2['id'], 
                'controller' => $value2['controller'], 
                'action' => $value2['action'], 
                'label_menu' => $value2['label_menu'], 
                'icon' => $value2['icon'], 
                'child' => $n, 
            );
        }
        return $as;
    }

}

