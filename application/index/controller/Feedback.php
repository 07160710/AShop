<?php
namespace app\index\controller;

class Feedback extends \think\Controller{
	
	public function feedback(){
		return $this->fetch();
	}
	public function fback(){
		$f=new \app\index\model\Feedback();
		$name=input('post.name');
		$phone=input('post.phone');
		$content=input('post.content');
		$sql=$f->where('f_name',$name)->find();
		if($sql){
			echo '<h1>你已反馈过.我们会尽快处理. 点击此处 <a href="javascript:history.back(-1);">返回</a></h1>';
		}else{
			$data['f_name']=$name;
			$data['f_phone']=$phone;
			$data['f_content']=$content;
			$f->insert($data);
			$this->success("<h1>反馈成功，我们会尽快处理</h1>","index/index/index");
		}
	}
}