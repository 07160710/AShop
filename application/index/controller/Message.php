<?php
namespace app\index\controller;
use think\Paginator;

class Message extends \think\Controller{
	public function mess(){
		$sss = new \app\index\model\Message();
		$data = $sss->field('message_id, name, content ,createAt')->order('createAt desc')->paginate(3);
		$this->assign('message',$data);
		return $this->fetch();
	}
	public function messdo(){
		$mess=new \app\index\model\Message();
		//$messname=input('post.messname');
		$content=input('post.content');
		if(empty($content)){  
            $this->error('留言不能为空');
        }else if(mb_strlen($content,'utf-8') > 100){  
            $this->error('留言内容最多100字');
        }else{
        	$mess->name=input('post.messname');
        	$mess->content=input('post.content');
        	$mess->createAt=time();
        	$mess->save();
        	$this->success("<h1>留言成功</h1>","message/mess");
        }    
	}
	
}