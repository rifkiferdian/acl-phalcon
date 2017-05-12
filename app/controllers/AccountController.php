<?php
use Phalcon\Mvc\Url;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Controller;
use Phalcon\Security;
use Phalcon\Mvc\Router;
use Phalcon\Session\Adapter\Files as SessionAdapter;

    	
class AccountController extends \Phalcon\Mvc\Controller
{

    public function initialize()
    {        
        
    }

    public function indexAction()
    {

    }

    public function loginEndAction($value='')
    {
        if (!empty($this->session->get('uid'))) {
            return $this->response->redirect('index');
        }

        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }

    

    public function loginAction(){
        if (!empty($this->session->get('uid'))) {
            return $this->response->redirect('index');
        }
    	$this->view->pick("account/login");
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    }    

    public function loginProsesAction(){

        if ($this->request->isPost()) {

            $uid    = $this->request->getPost('uid');
            $passwd = $this->request->getPost('passwd');

            // Find the user in the database
            $user = RefUser::findFirst(
                [
                    "uid = :uid: AND passwd = :passwd: AND aktif = 'Y'",
                    "bind" => [
                        "uid"    => $uid,
                        "passwd" => md5($passwd),
                    ]
                ]
            );

            if ($user !== false) {

                //data_session_yang_dikirim
                $session = new SessionAdapter();
                $session->start();
                $session->set('uid', $user->uid);
                $session->set('nama', $user->nama);
                $session->set('usergroup', $user->usergroup);
                
                return $this->response->redirect('index');

            }

            $this->flashSession->error("GAGAl MASUK");
            return $this->response->redirect('account/login');
            
        }

        $this->flashSession->error("GAGAl MASUK");
        return $this->response->redirect('account/login');

    }

    public function registerProsesAction(){
    	$user = new RefUser();
    	if ($this->request->isPost()) {
	        $uid    = $this->request->getPost('uid');
	        $passwd = $this->request->getPost('password');
	        $email 	= $this->request->getPost('email');
    		$user->assign(array(
		        'uid' => $uid,
		        'email' => $email,
		        'nama' => 'poh',
		        'aktif' => 'Y',
    			'passwd' => $this->security->hash($passwd)
    			)
    		);
    	}

        // Store the password hashed

        // if($user->save()){
        // 	echo "register successfull.";
        // }else{
        // 	echo "register failed.";
        // }
    }

    public function logoutAction(){
        session_destroy();
        $this->session->destroy();
        return $this->response->redirect('account/login');
    }

    public function loginProsesAgainAction(){

        if ($this->request->isPost()) {

            $uid    = $this->request->getPost('uid');
            $passwd = $this->request->getPost('passwd');

            // Find the user in the database
            $user = RefUser::findFirst(
                [
                    "uid = :uid: AND passwd = :passwd: AND aktif = 'Y'",
                    "bind" => [
                        "uid"    => $uid,
                        "passwd" => md5($passwd),
                    ]
                ]
            );

            if ($user !== false) {
                //data_session_yang_dikirim
                $session = new SessionAdapter();
                $session->start();
                $session->set('uid', $user->uid);
                $session->set('nama', $user->nama);
                $session->set('usergroup', $user->usergroup);
                
                return $this->response->redirect('index');
            }

            $this->flashSession->error("GAGAl MASUK");
            return $this->response->redirect('account/login');
            
        }

        $this->flashSession->error("GAGAl MASUK");
        return $this->response->redirect('account/login');

    }

}

