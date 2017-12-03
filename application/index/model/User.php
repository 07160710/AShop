<?php
namespace app\index\model;
use think\Model;

class User extends Model
{
	protected $auto = ['user_name'];
	protected $insert = ['user_logintimes' => 0];  

	protected function setUserNameAttr($value)
    {
        return strtolower($value);
    }
    public function login($username,$password){
    	$admin=\think\Db::table('tb_user')->where('user_name',$username)->find();
    	if($admin){
    		if($admin['user_pwd']==md5($password)){
    			return 1;
    		}else{
    			return 2;
    		}
    	}else{
    		return 3;
    	}
    }
	
}