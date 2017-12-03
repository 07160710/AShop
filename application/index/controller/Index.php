<?php
namespace app\index\controller;
use think\Db;
use think\Session;

class Index  extends \think\Controller
{
    public function index()
    {
    	$this->assign('user',Session::get('username'));
    	//$this->assign('isuser',Session::has('username'));
        $phone = new \app\index\model\Phones();
		$data= $phone->field('phone_id, phone_name, phone_newprice ,phone_img')->where('phone_issepprice=1')->find();
		$this->assign('phoneprice',$data);	
		return $this->fetch();
		
    }
}
