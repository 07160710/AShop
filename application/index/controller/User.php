<?php
namespace app\index\controller;
use app\index\model\User as Log;
use \think\Session;
use \think\Db;

class User extends \think\Controller
{
	//显示注册页面
	public function reg(){
        $this->assign('user',Session::get('username'));		
		return $this->fetch();
	}
	public function login(){
		return $this->fetch();
	}
	public function modifypassword(){
    	return $this->fetch();
    }
    public function edit(){
        $isuser=Session::get('username');
        $datas= \think\Db::table('tb_user')->where('user_name',$isuser)->find();
        $this->assign('edituser',$datas);
        return $this->fetch();
    }
    public function people(){
    	$isuser=Session::get('username');
    	$data= \think\Db::table('tb_user')->where('user_name',$isuser)->find();
    	$this->assign('onlyuser',$data);
    	return $this->fetch();
    }
	
    public function insert(){

		$u=new \app\index\model\User();
		$username=\think\Request::instance()->post('username'); // 获取某个post变量username
		$password=input('post.password');
		$password1=input('post.repass');
		$gender= input('post.gender'); //性别
		$email=input('post.email');
		if (md5($password)==md5($password1)){
			$sql=$u->where('user_name',$username)->find();
			if($sql){
				echo '<h1>该用户已存在. 点击此处 <a href="javascript:history.back(-1);">返回</a></h1>';
			}else{
				$data['user_name']=$username;
				$data['user_pwd']=md5($password);
				$data['user_sex']=$gender;
				$data['user_email']=$email;
				$u->insert($data); // 插入数据库
				$this->success("<h1>注册成功</h1>","index/index/index");
			}
		}else{
			echo '<h1>两次密码不一样. 点击此处 <a href="javascript:history.back(-1);">返回</a></h1>';
		}		
    }

    public function insert2(){
    	$data['user_name']=\think\Request::instance()->post('username'); // 获取某个post变量username
    	$data['user_truename']=input('post.truename');
		$data['user_pwd']=input('post.password');
		$data['repass']=input('post.repass');
		$data['user_sex']=input('post.gender'); //性别
		$data['user_email']=input('post.email');

		$validate = \think\Loader::validate('User');
		if(!$validate->check($data)){
			//echo '<h1>'.$validate->getError().' 点击此处 <a href="javascript:history.back(-1);">返回</a></h1>';
			$this->error($validate->getError());
		}

		$u=new \app\index\model\User();
		$u->user_name=\think\Request::instance()->post('username');
		$u->user_truename=input('post.truename');
		$u->user_pwd=md5(input('post.password'));
		$u->user_sex=input('post.gender'); //性别
		$u->user_email=input('post.email');
		$u->save();
		$this->success("<h1>注册成功</h1>","index/index/index");
    }
    public function logindo(){
    	//echo '这里是登录处理';
    	if(request()->isPost()){
    		$login = new Log();
    		$status = $login->login(input('username'),input('password'));
    		if($status==1){
    			session_start();
    			Session::set('username',input('username'));
    			//$('#reg').hide();
    			return $this->success("登录成功","index/index");
    		}elseif($status==2){
    			return $this->error("账号或密码错误！");
    		}else{
    			return $this->error("用户不存在！");
    		}
    	}
    }
    public function loginout(){
    	$deleteSession=Session::delete('username');
    	$hasSession=Session::get('username');
    	if($hasSession==null){
    		return $this->success("退出成功","index/index");
    	}else{
    		return $this->error("退出失败","index/index");
    	}
    }
    public function changepass(){
    	$isuser=Session::get('username');
    	$oldpassword=input('post.oldpassword');
    	$datas=\think\Db::table('tb_user')->where('user_name',$isuser)->find();
    	if($datas['user_pwd']==md5($oldpassword)){
    		$newpassword=input('post.newpassword');
    	    $newpassword1=input('post.newpassword1');
    	    if($newpassword==$newpassword1){
    	    	$p=new \app\index\model\User();
    	    	$p->where('user_name',$isuser)->update(['user_pwd'=>md5($newpassword)]);
    	    	return $this->success("修改密码成功","index/index");
    	    }else{
    	    	return $this->error("密码不相同","index/index");
    	    }
    	}else{
    		return $this->error("原来的密码输入错误","index/index");
    	}

    }
    public function edituser(){
            $p=new \app\index\model\User();
            $newtruename=input('post.truename');
            $gender=input('post.gender');
            $email=input('post.email');
            $phone=input('post.phone');
            $address=input('post.address');
            $p->where('user_name',$isuser)->update(['user_truename'=>$newtruename],['user_sex'=>$gender],['user_email'=>$email],['user_tel'=>$phone],['user_address'=>$address]);
            return $this->success("修改个人信息成功","user/people");
    }

}