<?php

class RefUser extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     */
    public $uid;

    /**
     *
     * @var string
     */
    public $usergroup;
 
    private $passwd;
    public $nip;


    /**
     *
     * @var string
     */
    public $nama;
    public $email;


    /**
     *
     * @var string
     */
    public $aktif;

    /**
     *
     * @var string
     */
    public $hapus;

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'ref_user';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return RefUser[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return RefUser
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
