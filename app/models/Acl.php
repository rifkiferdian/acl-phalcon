<?php

class Acl extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $controller;

    /**
     *
     * @var string
     */
    public $action;
    public $parent;
    public $is_menu;
    public $label_menu;
    public $child;
    public $icon;

    /**
     *
     * @var string
     */
    public $usergroup_id;

    /**
     *
     * @var string
     */
    public $except_user;

    /**
     *
     * @var string
     */
    public $aktif;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */

    public function getSource()
    {
        return 'acl';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Acl[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Acl
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }
    
    public function getAclByUid($uid){
        $ug = RefUsergroup::find();
        foreach ($ug as $k => $v) {
            $ug_db[$v->id]=$v->nama;
        }

        $user = RefUser::findFirst("uid='$uid'");
        if (!empty($user->usergroup)) {
            $ug_arr=explode(",",$user->usergroup);
            foreach ($ug_arr as $k => $v) {
                if ($v!='') {
                    $ug_arr1[$v]=$ug_db[$v];
                    $ug_sql[]="usergroup_id like '%,$v,%'";
                }
            }
            $ug_sql_string=implode(" or ",$ug_sql);
            $phql="SELECT * FROM Acl a WHERE $ug_sql_string or except_user like '%$uid%'";
            $db = $this->modelsManager->executeQuery($phql);
            $arr=[];
            $action_arr=[];
            foreach ($db as $k=>$v) {
                $arr[$k]['id']=$v->id;
                $arr[$k]['controller']=$v->controller;
                $arr[$k]['action']=$v->action;
                $arr[$k]['usergroup_id']=$v->usergroup_id;
                $arr[$k]['except_user']=$v->except_user;
                $arr[$k]['aktif']=$v->aktif;
                 
                $controller_arr[$v->controller]=1;
                if ($v->action!='') {
                    $action_url="/".$v->action;
                    $action_arr[$v->controller][$v->action]=1;
                }else{
                    $action_url='';
                }
                $url_arr[]=$v->controller.$action_url;
            }
            // $public = Acl::find("usergroup_id like '%,66,%'");
            // foreach ($public as $k1 => $v1) {
            //     $public_arr[]=$v1->controller;
            // }
            $public_arr=explode(",",PUBLIC_CONTROLLER);
            $hak_akses=array(
                'usergroup'=>$ug_arr1,
                'url'=>$url_arr,
                'public_controller'=>$public_arr,
                // 'controller'=>$controller_arr,
                'action'=>$action_arr
            );
            return $hak_akses;
        }
    }
}
