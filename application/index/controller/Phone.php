<?php
namespace app\index\controller;
use app\index\model\Phonetype;
use think\Paginator;

class Phone extends \think\Controller
{

	public function phonetype()
    {
        $bigtype = new Phonetype();
    	$data1 = $bigtype->field('b_id,b_name')->select();
        $this->assign('bb',$data1);

        $data2=$bigtype->alias('a')->join('tb_smalltype b','a.b_id = b.b_id')->select();
        $this->assign('ss',$data2);

        return $this->fetch();
    }


    public function phonelist(){
		$book=new \app\index\model\Phones();
		$data=$book->where('s_id', input('get.sid'))->select();
		$this->assign('blist',$data);
		//dump($data);	
		return $this->fetch();
	}

    public function phone(){
        $book=new \app\index\model\Phones();
        $data= $book->where('phone_id', input('get.phone_id'))->find();
        $this->assign('book',$data);    
        //dump($data);  
        return $this->fetch();
    }

}