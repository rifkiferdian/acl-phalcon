<?php
use Phalcon\Mvc\View;
use Phalcon\Validation;
use  Phalcon\Validation\Validator\PresenceOf;

class AclController extends \Phalcon\Mvc\Controller
{

	public function initialize()
    {
        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }
    }

    public function indexAction()
    {
        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }else{
            
        	$usergroup = RefUsergroup::find()->toArray();

            $this->view->usergroup = $usergroup;
            $this->view->uus = $usergroup;
        	$this->view->acl = $this->menuAction();

        	$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        }
    }

    function addIndukMenuAction()
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        $validation = new Phalcon\Validation(); 
        $validation->add('label_menu1', new PresenceOf(array(
            'message' => 'label_menu tidak boleh kosong'
        )));

         
        $messages = $validation->validate($_POST);
        $pesan = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $pesan .= "$message"."</br>";
            }
            $notif = array(
                'title' => 'warning',
                'text' => $pesan,
                'type' => 'warning'
            );
        }else{
            $Acl = new Acl();
            $Acl->assign(array(
                        'label_menu' => $_POST['label_menu1'],
                        'parent' => $_POST['parent1'],
                        'usergroup_id' => ','.$_POST['usergroup1'].',',
                        'except_user' => $_POST['kecuali_user1'],
                        'aktif' => $_POST['aktif1'],
                        'icon' => $_POST['icon1'],
                        'child' => "Y"
                        )
                    );

            $Acl->save();
            $notif = array(
                'title' => 'success',
                'text' => 'Data berhasil di Input',
                'type' => 'success'
            );
        }

        echo json_encode($notif);
        
    }

    function addAnakMenuAction()
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        $validation = new Phalcon\Validation(); 
        $validation->add('label_menu', new PresenceOf(array(
            'message' => 'label_menu tidak boleh kosong'
        )));
        $validation->add('controller', new PresenceOf(array(
            'message' => 'controller tidak boleh kosong'
        )));
         
        $messages = $validation->validate($_POST);
        $pesan = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $pesan .= "$message"."</br>";
            }
            $notif = array(
                'title' => 'warning',
                'text' => $pesan,
                'type' => 'warning'
            );
        }else{
            $Acl = new Acl();

            $Acl->assign(array(
                        'controller' => $_POST['controller'],
                        'action' => $_POST['action'],
                        'parent' => $_POST['parent'],
                        'label_menu' => $_POST['label_menu'],
                        'usergroup_id' => ','.$_POST['usergroup'].',',
                        'except_user' => $_POST['kecuali_user'],
                        'aktif' => $_POST['aktif'],
                        'icon' => $_POST['icon']
                        )
                    );

            $Acl->save();
            $notif = array(
                'title' => 'success',
                'text' => 'Data berhasil di Input',
                'type' => 'success'
            );
        }

        echo json_encode($notif);
        
    }

    function editIndukMenuAction($id)
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        $validation = new Phalcon\Validation(); 
        $validation->add('label_menu1', new PresenceOf(array(
            'message' => 'label_menu tidak boleh kosong'
        )));

         
        $messages = $validation->validate($_POST);
        $pesan = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $pesan .= "$message"."</br>";
            }
            $notif = array(
                'title' => 'warning',
                'text' => $pesan,
                'type' => 'warning'
            );
        }else{
            $Acl = Acl::findFirstById($id);
            $Acl->assign(array(
                        'label_menu' => $_POST['label_menu1'],
                        'parent' => $_POST['parent1'],
                        'usergroup_id' => ','.$_POST['usergroup1'].',',
                        'except_user' => $_POST['kecuali_user1'],
                        'aktif' => $_POST['aktif1'],
                        'icon' => $_POST['icon1'],
                        'child' => "Y"
                        )
                    );

            $Acl->save();
            $notif = array(
                'title' => 'success',
                'text' => 'Data berhasil di Edit',
                'type' => 'success'
            );
        }

        echo json_encode($notif);
        
    }

    function editAnakMenuAction($id)
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        $validation = new Phalcon\Validation(); 
        $validation->add('label_menu', new PresenceOf(array(
            'message' => 'label_menu tidak boleh kosong'
        )));
        $validation->add('controller', new PresenceOf(array(
            'message' => 'controller tidak boleh kosong'
        )));
         
        $messages = $validation->validate($_POST);
        $pesan = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $pesan .= "$message"."</br>";
            }
            $notif = array(
                'title' => 'warning',
                'text' => $pesan,
                'type' => 'warning'
            );
        }else{
            $Acl = Acl::findFirstById($id);

            $Acl->assign(array(
                        'controller' => $_POST['controller'],
                        'action' => $_POST['action'],
                        'parent' => $_POST['parent'],
                        'label_menu' => $_POST['label_menu'],
                        'usergroup_id' => ','.$_POST['usergroup'].',',
                        'except_user' => $_POST['kecuali_user'],
                        'aktif' => $_POST['aktif'],
                        'icon' => $_POST['icon']
                        )
                    );

            $Acl->save();
            $notif = array(
                'title' => 'success',
                'text' => 'Data berhasil di Edit',
                'type' => 'success'
            );
        }

        echo json_encode($notif);
        
    }

    


    public function deleteAclAction($id)
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        $del=Acl::findById($id);
        $del->delete();
        echo json_encode(array("status" => true));
    }

    public function cek_anak($phql2,$ug_sql_string)
    {
        
        $uid = $this->session->get('id');
        $query2 = $this->modelsManager->executeQuery($phql2)->toArray();    
        foreach ($query2 as $key2 => $value2) {
            $n = '';
            if ($value2['child'] != '') {
                $q = $value2['id'];
                $asd  = "SELECT * from Acl where parent = '$q' and except_user <> ',$uid,' ";
                $n = $this->cek_anak($asd,$ug_sql_string);
            }

            $as[] = array(
                'id' => $value2['id'], 
                'controller' => $value2['controller'], 
                'action' => $value2['action'], 
                'label_menu' => $value2['label_menu'], 
                'icon' => $value2['icon'], 
                'child' => $n, 
                'anak' => $value2['child'], 
                'usergroup_id' => $value2['usergroup_id'], 
                'except_user' => $value2['except_user'], 
                'aktif' => $value2['aktif'], 
                'parent' => $value2['parent'], 
            );
        }
        return $as;
    }

    public function menuAction(){

        $usergroup = $this->session->get('usergroup');
        $uid = $this->session->get('id');
        if (!empty($usergroup)) {
            $ug_arr=explode(",",$usergroup);
            foreach ($ug_arr as $k => $v) {
                if ($v!='') {
                    $ug_sql[]="usergroup_id like '%,$v,%'";
                }
            }
        }
        $ug_sql_string=implode(" or ",$ug_sql);

        $phql = "SELECT * from Acl where parent = '0' and except_user <> ',$uid,' ";
        // echo "<pre>".print_r($phql,1)."</pre>";die();
        $query = $this->modelsManager->executeQuery($phql)->toArray();

        foreach ($query as $key => $value) {

            $query2 = '';
            if ($value['child'] != '') {
                $id = $value['id'];
                $phql2  = "SELECT * from Acl where parent = '$id' and except_user <> ',$uid,' ";         
                $query2 = $this->cek_anak($phql2,$ug_sql_string);
            }

            $dt[] = array(
                'id' => $value['id'], 
                'controller' => $value['controller'], 
                'action' => $value['action'], 
                'label_menu' => $value['label_menu'], 
                'icon' => $value['icon'], 
                'child' => $query2, 
                'anak' => $value['child'], 
                'usergroup_id' => $value['usergroup_id'], 
                'except_user' => $value['except_user'], 
                'aktif' => $value['aktif'], 
                'parent' => $value['parent'], 

            );
        }

        return $dt;
    }

}

