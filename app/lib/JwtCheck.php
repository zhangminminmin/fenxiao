<?php

namespace App\lib;

use Firebase\JWT\JWT;
// 单例模式
class JwtCheck
{
    private static $instance;

    // 加密后的token
    private $token;
    // 解析JWT得到的token
    private $decodeToken;
    // 用户ID
    private $uid;
    // jwt密钥
    private $secrect = 'WDJSLcu9ADNDeMZP1KvtIz0h94kX43lU';

    // jwt参数8658c5449f0302ace34545e0cac7e61b
    private $exp = 3600*24*7;//过期时间(秒)

    /**
     * 获取token
     * @return string
     */
    public function getToken()
    {
        return (string)$this->token;
    }

    /**
     * 设置类内部 $token的值
     * @param $token
     * @return $this
     */
    public function setToken($token)
    {
        $this->token = $token;
        return $this;
    }


    /**
     * 设置uid
     * @param $uid
     * @return $this
     */
    public function setUid($uid)
    {
        $this->uid = $uid;
        return $this;
    }

    /**
     * 得到 解密过后的 uid
     * @return mixed
     */
    public function getUid()
    {
        return $this->uid;
    }

    /**
     * 加密jwt
     * @return $this
     */
    public function encode()
    {
        $payload = ['user_id' => $this->uid,'exp'=> time() + $this->exp];
        $this->token = JWT::encode($payload, 'fenxiao');
        return $this;
    }


    /**
     * 解密token
     * @return \Lcobucci\JWT\Token
     */
    public function decode()
    {
        $payload = JWT::decode($this->token, 'fenxiao',array('HS256'));
        if (!isset($payload->user_id)) {
            throw new \Exception('token验证失败 请重新登录',203);
        }
        if ($payload->exp < time()) {
            throw new \Exception('token已失效 请重新登录',203);
        }
        $this->uid = $payload->user_id;
        return $payload;
    }


    /**
     * 该类的实例
     * @return JwtAuth
     */
    public static function  getInstance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * 单例模式 禁止该类在外部被new
     * JwtAuth constructor.
     */
    private function __construct()
    {
    }

    /**
     * 单例模式 禁止外部克隆
     */
    private function __clone()
    {
        // TODO: Implement __clone() method.
    }
}





?>
