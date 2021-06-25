<?php

namespace App\admin\Actions\Test;

use Encore\Admin\Actions\Action;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Encore\Admin\Actions\RowAction;
use Yansongda\Pay\Pay;
class Withdrawal extends RowAction
{
    protected $selector = '.withdrawal';
    public $name = '提现审核';
    public function handle(Model $model,Request $request)
    {
        $id = $request->get('_key');
        $info = \App\Models\Withdrawal::where('id', $id)->first();
        if ($info['status'] != 1) {
            return $this->response()->error('订单已经审核 无须重复操作')->refresh();
        }else{
            $data = ['status' => 2,];
//            $order = [
//                'out_biz_no' => time(),
//                'trans_amount' => $info['money'],
//                'product_code' => 'TRANS_ACCOUNT_NO_PWD',
//                'biz_scene' => 'DIRECT_TRANSFER',
//                'payee_info' => [
//                    'identity' => $info['alipaycode'],
//                    'identity_type' => 'ALIPAY_LOGON_ID',
//                    'name' => $info['realname'],
//                ],
//            ];
//            Pay::alipay(config('pay.alipay'))->transfer($order);
//            print_r($order);

            $edit = \App\Models\Withdrawal::where('id', $id)->update($data);
            return $this->response()->success('提现审核成功！')->refresh();

        }
    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default withdrawal"></a>
HTML;
    }

    public function fz($data)
    {
        require base_path() . '/alipay/aop/AopCertClient.php';
        require base_path() . '/alipay/aop/request/AlipayFundTransUniTransferRequest.php';

        $aop = new \AopCertClient();
        $appCertPath = base_path() . '/cert/appCertPublicKey_2021002114619353.crt';
        $alipayCertPath = base_path() . '/cert/alipayCertPublicKey_RSA2.crt';
        $rootCertPath = base_path() . '/cert/alipayRootCert.crt';

        $aop->gatewayUrl = 'https://openapi.alipay.com/gateway.do';
        $aop->appId = '2021002114619353';
        $aop->rsaPrivateKey = 'MIIEpAIBAAKCAQEArVvM4xEgcOu7QwsJCX4YgJ+W5H0EECC5gGefMq0QydwxpXWIP05Q/HlppftDY5J4l609QTVMheqo2YaOVClzpbzE33s/xlBzwC3fNrzPm7i4Dnx4ukZqaMnVBeJlZiZaDi1hw5d41H1SW4LEPBU24tTXYj6veVQz4xzM2+QeH+46HqultKR/1tmNQN93QtEXURiY+l/pqf/WS/3Ta3NEyIOFDbTsH+4I5Td3NxR4gILfTK0Y0v6LpRf1njR7xdTY+050/9wUoD6oOGCC+JE1pdYaLqGaffDL4dR9EFWa+7pm0TgdNbgCmVZcgUlD0OgiEWHRD97sVF08psBPvwPXWwIDAQABAoIBAB8XedW3uqPGA53wmrxTGz3mYX+1VEc4N0zqSMkj9QDfNyA/xiHkf+3oMKSOPfXbzTkW3weU8ZaLEaGB2oEJti4hfwW96yA8SaZME96TWoDJTml6tYRjIK6OlGArzJfXhQtJ5GDaB9fEakLzXxKPk3p3RfHe4EXYbj3ramp9rVF4cuqsPRqo/8oVBu/Bv/9dCfEW8awyissdiiGzFiptSgcyfBSdxr+SUrKz2gI/p/VwSYvV5QqgaTgfjlx1cR9B5B46UIJ6Y2YcIPM0vG3EkJti5/aWglXDgKF4hgW+0wFLKgdvhjw+RY8i5yPwkl69tf09PeOGx+yxCM5rZO1GaMECgYEA1zYzRXCuHatrWcugtbEmFfXgWA0xu/0L9qwBeT1DdxvgCfVGR0iWD+7bofIrNsOP+7ONrVivHF7vE9AbmVd/d0mOqFHnMAd7A/Ut+WXJ9S4wRJKgBPtKU6qmMGFbLJjccHtlEgyxzkElglLALj68k5UewTbOSKm3HzcmLzcWEcsCgYEAzjbwhLSP1ZRCv/bdGcvtn4TBn8ZG5hItkBoDaW/XzZOfy0PG9ADVKDPEDklcjfy2+R0qB38+lJfRL5otq+wy5V9eVy6RlGSAwSgygHVamx21LntpzVkN6kbsn2W8bfKygSWR7dmEUF3Bo3PYWyaTeVaZgNMre+h7kXJ4/g+LXrECgYBI9pQ9Z61wW6yinfnXf77E1T6BO7/v1yPWNoytWQrld+rmFWUFR+OwdS+7YQorn/PRxxcyfQ2pVbpCglzJCTQq8iJOiK4Tx4V6WwaCNnNZD5bHuNpNthCF+yYq4ubxYMXj0MH8c5dYsReRbpK/Wv++HWF26ijX08pE6AKnIUr3LwKBgQDH2v8n3kc4W8SFf5+xjK7z1xpA202DVULLUirUWQzxtI091qZPfS8ZE3KD1h3Zjn9W2CkPswbXxHt8gxSYdwasvs0T+ZImG3GdwnOPhC0YAKbEMd/MoO6Xi71wjo0ckgbmm57ewd02dmdhHrklPjHXe1KyQ/b009BOmn8g27fbQQKBgQCxo6ojqMXQdQtP8gBPDRbtUkaWWkcjXR4oAm7MhLoXcjFIUrVxThfQG8ZJ0gwZUiM8j3MZV6IQR4XiTXkTZbIonQNUB9ou/xKAa4O9FrIpPLWWpKF6i2CggdJ35MdLcfRrGxMJO9PbsSUSz2aXymbtRuTckjjRgcq4DyNVBVDXSw==';
        $aop->alipayrsaPublicKey = $aop->getPublicKey($alipayCertPath);
        $aop->apiVersion = '1.0';
        $aop->signType = 'RSA2';
        $aop->postCharset = 'utf-8';
        $aop->format = 'json';
        $aop->isCheckAlipayPublicCert = true;//是否校验自动下载的支付宝公钥证书，如果开启校验要保证支付宝根证书在有效期内
        $aop->appCertSN = $aop->getCertSN($appCertPath);//调用getCertSN获取证书序列号
        $aop->alipayRootCertSN = $aop->getRootCertSN($rootCertPath);//调用getRootCertSN获取支付宝根证书序列号

        $request = new \AlipayFundTransUniTransferRequest();
        $request->setBizContent(json_encode($data));
        $result = $aop->execute($request);
        var_dump($result);die;

    }
}
