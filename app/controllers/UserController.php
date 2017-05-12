<?php
use Phalcon\Mvc\View;
use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Numericality;

class UserController extends \Phalcon\Mvc\Controller
{
  	public function initialize()
    {
        if (empty($this->session->get('uid'))) {
            $this->response->redirect('account/loginEnd');
        }
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    public function profilAction()
    {
      if ($this->session->get('id_jenis') == 1) {
        $nip = $this->session->get('nip');
        $cmd  = "SELECT * from RefAkdSdm where nip = '$nip'";
        $query = $this->modelsManager->executeQuery($cmd);
        $query2 = $this->modelsManager->executeQuery($cmd)->toArray();
        $this->view->profil = $query;
        $this->view->profil2 = $query2;
        
        $this->view->pick('akd_user/sdm_profil');
      } elseif($this->session->get('id_jenis') == 2) {
        $this->view->pick('akd_user/mhs_profil');
      }      
    }

    public function resetAction($id)
    {
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
        $user = RefUser::findFirst($id);
        $pas_db = $user->passwd;
        $pas_in = md5($_POST['pass']);
        $pas_bar = md5($_POST['pass_baru']);

        if ($pas_db != $pas_in) {
          $notif = array(
            'class'   => 'warning',
            'pesan1'  => 'Password yang anda masukkan salah',
            'pesan2'  => 'Warning',
          );

        } else {

          $validation = new Phalcon\Validation();
      		$validation->add('pass_baru', new PresenceOf(array(
      		    'message' => 'Password Baru tidak boleh kosong'
      		)));
      		$validation->add('pass', new PresenceOf(array(
      		    'message' => 'Password Lama tidak boleh kosong'
      		)));

      		$messages = $validation->validate($_POST);
      		$pesan    = '';
      		if (count($messages)) {
      		    foreach ($messages as $message) {
      		        $pesan .= "$message"."</br>";
      		    }
      			$notif = array(
      				'class'   => 'warning',
      				'pesan1'  => $pesan,
      				'pesan2'  => 'Warning',
      			);
      		}else{
            $user->assign(array(
              'passwd'  => $pas_bar
            ));

            $simpan = $user->save();
            $notif = array(
              'class'   => 'success',
              'pesan1'  => 'Password berhasil di update',
              'pesan2'  => 'Success',
            );
      		}

        }
        echo json_encode($notif);
    }

    private function imageCheck($extension)
    {
        $allowedTypes = [
            'image/gif',
            'image/jpg',
            'image/png',
            'image/jpeg'
        ];

        return in_array($extension, $allowedTypes);
    }

    public function uploadFotoAction($value='')
    {
        $nip = $this->session->get('nip');
        if ($this->session->get('id_jenis') == 1) {
          $urel =  DOCUMENT_ROOT.'img/sdm/';
        } elseif($this->session->get('id_jenis') == 2) {
          $urel =  DOCUMENT_ROOT.'img/mhs/';
        }
        // Check if the user has uploaded files
        if ($this->request->hasFiles()) {
            $files = $this->request->getUploadedFiles();

            // Print the real file names and sizes
            foreach ($files as $file) {

                $ex = explode('/', $file->getRealType()) ;
                $nama_file = $nip.'.'.$ex[1];

                //validasi men
                if ($this->imageCheck($file->getRealType())) {
                    if ($file->moveTo( $urel.$nama_file)) {
                        $this->db->execute("UPDATE ref_akd_sdm SET `foto`=? WHERE nip = ? ",array($nama_file,$nip));
                        $notif = array(
                            'title' => 'success',
                            'text' => 'Data berhasil di Upload',
                            'type' => 'success',
                        );
                    } else {
                        $notif = array(
                            'title' => 'warning',
                            'text' => "Gagal Upload",
                            'type' => 'warning',
                        );
                    }
                    echo json_encode($notif);
                } else {
                    $notif = array(
                        'title' => 'warning',
                        'text' => "Gagal Upload. File harus Image",
                        'type' => 'warning',
                    );
                    echo json_encode($notif);
                }                
                
            }
        }
    }

    public function gantiLoginAction($value='')
    {
      if ($this->session->get('id_jenis') == 1) {
        $this->view->pick('akd_user/ganti_login_sdm');
      } elseif($this->session->get('id_jenis') == 2) {
        $this->view->pick('akd_user/ganti_login_mhs');
      }
    }

    public function resetSdmAction()
    {
      $nip = $this->session->get('nip');
      $pass_lama = $_POST["pass_lama"];
      $username = $_POST["username"];
      $pass_baru = md5($_POST["pass_baru"]);

      $validation = new Phalcon\Validation(); 
      $validation->add('pass_lama', new PresenceOf(array(
          'message' => 'pass_lama tidak boleh kosong',
      )));
      $validation->add('username', new PresenceOf(array(
          'message' => 'username tidak boleh kosong',
      )));
      $validation->add('pass_baru', new PresenceOf(array(
          'message' => 'pass_baru tidak boleh kosong',
      )));

      $messages = $validation->validate($_POST);
        $pesan = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $pesan .= "$message"."</br>";
            }
            $notif = array(
                'status' => false,
                'title' => 'warning',
                'text' => $pesan,
                'type' => 'warning',
            );
        }else{
            $user = RefUser::findFirst(
                [
                    "nip = :nip: AND passwd = :passwd:",
                    "bind" => [
                        "nip"    => $nip,
                        "passwd" => md5($pass_lama),
                    ]
                ]
            );  
            if ($user !== false) {

              $this->db->execute("UPDATE ref_user SET `uid`=? , `passwd`=? WHERE nip = ? ",array($username,$pass_baru,$nip));
              $notif = array(
                  'status' => true,
              );
            }else{
              $notif = array(
                  'status' => false,
                  'title' => 'warning',
                  'text' => "Password Lama Salah.",
                  'type' => 'warning',
              );
            }
        }
      echo json_encode($notif);
    }

///////////////////////////////////////////////////////
////////////////////// MAHASISWA ///////////////////////
///////////////////////////////////////////////////////

    public function resetMhsAction()
    {
      $nip = $this->session->get('nip');
      $pass_lama = $_POST["pass_lama"];
      $pass_baru = md5($_POST["pass_baru"]);

      $validation = new Phalcon\Validation(); 
      $validation->add('pass_lama', new PresenceOf(array(
          'message' => 'pass_lama tidak boleh kosong',
      )));

      $validation->add('pass_baru', new PresenceOf(array(
          'message' => 'pass_baru tidak boleh kosong',
      )));

      $messages = $validation->validate($_POST);
        $pesan = '';
        if (count($messages)) {
            foreach ($messages as $message) {
                $pesan .= "$message"."</br>";
            }
            $notif = array(
                'status' => false,
                'title' => 'warning',
                'text' => $pesan,
                'type' => 'warning',
            );
        }else{
            $user = RefUser::findFirst(
                [
                    "nip = :nip: AND passwd = :passwd:",
                    "bind" => [
                        "nip"    => $nip,
                        "passwd" => md5($pass_lama),
                    ]
                ]
            );  
            if ($user !== false) {

              $this->db->execute("UPDATE ref_user SET  `passwd`=? WHERE nip = ? ",array($pass_baru,$nip));
              $notif = array(
                  'status' => true,
              );
            }else{
              $notif = array(
                  'status' => false,
                  'title' => 'warning',
                  'text' => "Salah Memasukkan Password Lama .",
                  'type' => 'warning',
              );
            }
        }
      echo json_encode($notif);
    }
}
