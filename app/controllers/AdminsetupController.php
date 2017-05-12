<?php

use Phalcon\Mvc\View;
use Phalcon\Validation;
use  Phalcon\Validation\Validator\PresenceOf;
class AdminsetupController extends \Phalcon\Mvc\Controller
{
	public function initialize()
    {
        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }
    public function indexAction()
    {

    }

    public function deleteIdAction()
    {
    	$id = $_POST['id'];
    	$modul = $_POST['modul'];
    	$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    	$user = $modul::findFirst($id);
    	if ($user->delete()) {
    		$notif = array(
				'class' => 'success',
				'pesan1' => 'Data berhasil di hapus',
				'pesan2' => 'Success',
			);
    	}	
    	echo json_encode($notif);
		
    }


    //////////////////////////////
    /////////GROUP ACCESS//////////
    /////////////////////////////

    public function webGroupAction(){
    	$usergroup = RefUsergroup::find();
    	$this->view->usergroup = $usergroup;
    	$this->view->pick('admin/setup/web_group');
    }

    function editUsergroupAction($id)
    {
    	$validation = new Phalcon\Validation(); 
		$validation->add('nama', new PresenceOf(array(
		    'message' => 'Nama Area tidak boleh kosong'
		)));
		$validation->add('id_group', new PresenceOf(array(
		    'message' => 'ID Group tidak boleh kosong'
		)));

		$messages = $validation->validate($_POST);
		$pesan = '';
		//jika gagal falidasi
		if (count($messages)) {
		    foreach ($messages as $message) {
		        $pesan .= "$message"."</br>";
		    }
			$notif = array(
				'title' => 'warning',
				'text' => $pesan,
				'type' => 'warning',
			);
		}else{
			$RefUsergroup = RefUsergroup::findFirstById($id);
            $RefUsergroup->assign(array(
                        'id' => $_POST['id_group'],
                        'nama' => $_POST['nama'],
                        'deskripsi' => $_POST['deskripsi'],
                        'aktif' => $_POST['aktif']
                        )
                    );

            $RefUsergroup->save();
			$notif = array(
				'title' => 'success',
				'text' => 'Data berhasil di Edit',
				'type' => 'success',
			);
		}

		echo json_encode($notif);
		
    }

    function submitWebGroupAction($value='')
    {

    	$validation = new Phalcon\Validation(); 
		$validation->add('nama', new PresenceOf(array(
		    'message' => 'Nama tidak boleh kosong'
		)));
		$validation->add('id_group', new PresenceOf(array(
		    'message' => 'Id Group tidak boleh kosong'
		)));
		 
		$messages = $validation->validate($_POST);
		$pesan = '';
		if (count($messages)) {
		    foreach ($messages as $message) {
		        $pesan .= "$message"."</br>";
		    }
			$notif = array(
				'class' => 'warning',
				'pesan1' => $pesan,
				'pesan2' => 'Warning',
			);
		}else{
			$user_group = new RefUsergroup();
            $user_group->assign(array(
                        'id' => $_POST['id_group'],
                        'nama' => $_POST['nama'],
                        'deskripsi' => $_POST['deskripsi'],
                        'aktif' => $_POST['aktif']
                        )
                    );

            $user_group->save();
			$notif = array(
				'class' => 'success',
				'pesan1' => 'Data berhasil di input',
				'pesan2' => 'Success',
			);
		}

		echo json_encode($notif);
		
    }

   

}

