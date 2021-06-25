<?php

namespace App\lib;

class Helper
{
    /**
     * @param int $code
     * @param string $msg
     * @param array $data
     * @return \Illuminate\Http\JsonResponse
     *
     */
    public static function jsonData($code = 0, $msg = 'Success', $data = [])
    {
        return response()->json([
            'code' => $code,
            'msg' => $msg,
            'content' => $data
        ]);
    }

    /**
     * 短信接口
     */
    public static function sendSmsCode($mobile,$content,$sign,$templateId)
    {
        $flag = 0;
        $params=''; //要post的数据

        $argv = array(
            'accesskey'=>"KbbxbLLnwRQ7MMaQ",     //平台分配给用户的accesskey，登录系统首页可点击"我的秘钥"查看
            'secret'=>"MGkTGWdPRLvlmeHWdvTLATh1qhm2YbR3",     //平台分配给用户的secret，登录系统首页可点击"我的秘钥"查看
            'sign'=>$sign,   // 2611    141125 平台上申请的接口短信签名或者签名ID（须审核通过），采用utf8编码
            'templateId'=>$templateId,   // 3377   171823平台上申请的接口短信模板Id（须审核通过）
            'mobile'=>$mobile,   //接收短信的手机号码(只支持单个手机号)
            'content'=> $content  ,   //发送的短信内容是模板变量内容，多个变量中间用##或者$$隔开，采用utf8编码
        );

        //构造要post的字符串
        foreach ($argv as $key=>$value) {
            if ($flag!=0) {
                $params .= "&";
                $flag = 1;
            }
            $params.= $key."="; $params.= urlencode($value);// urlencode($value);
            $flag = 1;
        }
        $url = "http://api.1cloudsp.com/api/v2/single_send?".$params; //提交的url地址
        $con= substr( file_get_contents($url), 0,100 );  //获取信息发送后的状态
        $con_code = json_decode($con, true);
//        print_r($con_code);die;
        if($con_code['code'] == '0'){
            return true;
        }else{
            return false;
        }

    }
}





?>
