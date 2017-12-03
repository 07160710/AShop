<?php
namespace app\index\validate;
use think\Validate;

class User extends Validate
{
    protected $rule = [
        'user_name'  =>  'require|max:25',
        'user_email' =>  'email',
        'user_truename' => 'require|max:3',
        'user_pwd'=>'length:3,25',
        'repass'=>'require|confirm:user_pwd',
        'user_name'   => 'unique:user',
    ];
}