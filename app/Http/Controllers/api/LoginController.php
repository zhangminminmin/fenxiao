<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\City;
use App\Models\SendCode;
use App\Models\Terrace;
use App\Models\User;
use Illuminate\Http\Request;
use App\lib\Helper;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Firebase\JWT\JWT;
use App\lib\JwtCheck;
class LoginController extends Controller
{
    /**
     * 上傳頭像
     */
    public function uploadAvatar(Request $request)
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $userInfo = User::where('id', $user_id)->first();

        $avatar = $request->file('avatar');
        if (!$avatar) {
            return Helper::jsonData(202,'请上传头像');
        }
        $datetime = date('YmdHis');
        $avatar_ext = $avatar->getClientOriginalExtension();

        $image_ext = ['png','jpg','jpeg','gif','PNG','JPG','JPEG','GIF'];
        if (!in_array($avatar_ext, $image_ext)) {
            return Helper::jsonData(202, '头像必须为图片');
        }
        $this->uploadImage($avatar, 'avatar' . $datetime . '_' . $user_id);
        $data = [
            'avatar' => 'avatar' . $datetime . '_' . $user_id . '.' . $avatar_ext,
        ];
        User::where('id', $user_id)->update($data);
        return Helper::jsonData(200,'头像上传成功');
    }

    /**
     * @param Request $request
     * 注冊第一步
     */
    public function registerStepOne(Request $request)
    {
        $input = $request->all();
        $mobile = $request->get('mobile');
        $code = $request->get('code');
        $parent_id = $request->get('parent_id');
        $rules = [
            'mobile' => 'required|regex:/^1\d{10}$/',
            'code' => 'required'
        ];
        $msg = [
            'mobile.required' => '手机号码不能为空',
            'mobile.regex' => '手机格式不正确',
            'code.required' => '验证码不能为空',
        ];

        $validate = Validator::make($input, $rules, $msg);
        if($validate->fails()) {
            return Helper::jsonData(202, $validate->errors()->first());
        }

        if ($parent_info = User::where('mobile', $mobile)->get()->toArray()) {
            return Helper::jsonData(202, '手机号已存在 请勿重复注册');
        }

        if (!$code) {
            return Helper::jsonData(202, '验证码不正确');
        }
        $res = $this->checkSmsCode($mobile,$code,'reg');
        if ($res[0] != 200) {
            return Helper::jsonData(202,$res[1]);
        }

        return Helper::jsonData(200, '验证通过 请进行下一步');
    }

    /**
     * 注册第二部
     * mobile  手机号
     * code 验证码
     * password   密码
     * repassword  密码
     * city_id    城市id
     * terrace_ids 平台ids
     */
    public function registerStepTwo(Request $request)
    {
        $input = $request->all();
        $password = $request->get('password');
        $repassword = $request->get('repassword');
        $city_id = $request->get('city_id');
        $terrace_ids = $request->get('terrace_ids');
        $mobile = $request->get('mobile');
        $code = $request->get('code');
        $parent_id = $request->get('parent_id');

        $rules = [
            'mobile' => 'required|regex:/^1\d{10}$/',
            'code' => 'required',
            'password' => 'required',
            'city_id' => 'required',
            'terrace_ids' => 'required',
        ];
        $msg = [
            'mobile.required' => '手机号码不能为空',
            'mobile.regex' => '手机格式不正确',
            'code.required' => '验证码不能为空',
            'password.required' => '密码不能为空',
            'city_id.required' => '请选择城市',
            'terrace_ids.required' => '请至少选择一个平台',
        ];

        $validate = Validator::make($input, $rules, $msg);
        if($validate->fails()) {
            return Helper::jsonData(202, $validate->errors()->first());
        }

        if ($parent_info = User::where('mobile', $mobile)->get()->toArray()) {
            return Helper::jsonData(202, '手机号已存在 请勿重复注册');
        }

        if ($password != $repassword) {
            return Helper::jsonData(202, '两次密码输入不一致');
        }

        if (!$code) {
            return Helper::jsonData(202, '验证码不正确');
        }
        $res = $this->checkSmsCode($mobile,$code,'reg');
        if ($res[0] != 200) {
            return Helper::jsonData(202,$res[1]);
        }

        return Helper::jsonData(200,'信息验证成功！请进行下一步');
    }

    /**
     * 注册第三步
     */
    public function registerStepThree(Request $request)
    {
        $input = $request->all();
        $password = $request->get('password');
        $repassword = $request->get('repassword');
        $city_id = $request->get('city_id');
        $terrace_ids = $request->get('terrace_ids');
        $mobile = $request->get('mobile');
        $code = $request->get('code');
        $realname = $request->get('realname');
        $font_card = $request->file('font_card');
        $back_card = $request->file('back_card');
        $hand_card = $request->file('hand_card');
        $parent_id = $request->get('parent_id');

        $rules = [
            'mobile' => 'required|regex:/^1\d{10}$/',
            'code' => 'required',
            'password' => 'required',
            'city_id' => 'required',
            'terrace_ids' => 'required',
            'realname' => 'required',
            'font_card' => 'required',
            'back_card' => 'required',
            'hand_card' => 'required',
        ];
        $msg = [
            'mobile.required' => '手机号码不能为空',
            'mobile.regex' => '手机格式不正确',
            'code.required' => '验证码不能为空',
            'password.required' => '密码不能为空',
            'city_id.required' => '请选择城市',
            'terrace_ids.required' => '请至少选择一个平台',
            'realname.required' => '请填写真实姓名',
            'font_card.required' => '请上传身份证正面照',
            'back_card.required' => '请上传身份证反面照',
            'hand_card.required' => '请上传手持身份证照片',
        ];

        $validate = Validator::make($input, $rules, $msg);
        if($validate->fails()) {
            return Helper::jsonData(202, $validate->errors()->first());
        }

        if ($parent_info = User::where('mobile', $mobile)->get()->toArray()) {
            return Helper::jsonData(202, '手机号已存在 请勿重复注册');
        }

        if ($password != $repassword) {
            return Helper::jsonData(202, '两次密码输入不一致');
        }

        if (!$code) {
            return Helper::jsonData(202, '验证码不正确');
        }
        $res = $this->checkSmsCode($mobile,$code,'reg');
        if ($res[0] != 200) {
            return Helper::jsonData(202,$res[1]);
        }

        $datetime = date('YmdHis');
        $font_card_ext = $font_card->getClientOriginalExtension();
        $back_card_ext = $back_card->getClientOriginalExtension();
        $hand_card_ext = $hand_card->getClientOriginalExtension();

        $image_ext = ['png','jpg','jpeg','gif','PNG','JPG','JPEG','GIF'];
        if (!in_array($font_card_ext, $image_ext)) {
            return Helper::jsonData(202, '身份证正面照必须为图片');
        }
        if (!in_array($back_card_ext, $image_ext)) {
            return Helper::jsonData(202, '身份证反面照必须为图片');
        }
        if (!in_array($hand_card_ext, $image_ext)) {
            return Helper::jsonData(202, '手持身份证照必须为图片');
        }
        $this->uploadImage($font_card, 'font_card' . $datetime . $input['mobile']);
        $this->uploadImage($back_card, 'back_card' . $datetime . $input['mobile']);
        $this->uploadImage($hand_card, 'hand_card' . $datetime . $input['mobile']);

        // 上级id
        $info = User::where('id',$parent_id)->get()->toArray();

        $parent_two_id = 0;
        if ($info) {
            $parent_info = User::where('id', $info[0]['parent_id'])->get()->toArray();
            $parent_two_id = $parent_info ? $parent_info[0]['id'] : 0;
        }

        // 平台 和城市名称
        $city_info = City::where('id', $city_id)->get()->toArray();

        if (!$city_info || $city_info[0]['status'] == 2) {
            return Helper::jsonData(202, '选择的城市已被下架 请刷新重选');
        }

        $terrace_ids_arr = explode(',',$terrace_ids);
        $terrace_list = Terrace::whereIn('id',$terrace_ids_arr)->get('name')->toArray();
        $terrace_names = implode(',',array_column($terrace_list,'name'));
        $data = [
            'mobile' => $mobile,
            'password' => md5($password),
            'city_id' => $city_id,
            'city' => $city_info[0]['name'],
            'terrace_ids' => $terrace_ids,
            'terrace_names' => $terrace_names,
            'realname' => $realname,
            'front_card' => 'font_card' . $datetime . $input['mobile'] . '.' . $font_card_ext,
            'back_card' => 'back_card' . $datetime . $input['mobile'] . '.' . $back_card_ext,
            'hand_card' => 'hand_card' . $datetime . $input['mobile'] . '.' . $hand_card_ext,
            'parent_id' => $parent_id ? :0,
            'parent_two_id' => $parent_two_id,
            'avatar' => '',
            'created_at' => time(),
        ];

        $insertid = User::insertGetId($data);
        if (!$insertid) {
            return Helper::jsonData(202, '网络原因 注册失败！');
        }else{
            $jwt = JwtCheck::getInstance();
            $token = $jwt->setUid($insertid)->encode()->getToken();
            $this->delCode($mobile,$code,'reg');
            return Helper::jsonData(200, '注册成功！', ['token' => $token]);
        }
    }

    /**
     * @param Request $request
     * 登录
     */
    public function login(Request $request)
    {
        $input = $request->all();
        $mobile = $request->get('mobile');
        $password = $request->get('password');

        $rules = [
            'mobile' => 'required',
            'password' => 'required'
        ];
        $msg = [
            'mobile.required' => '手机号码不能为空',
            'password.required' => '密码不能为空',
        ];

        $validate = Validator::make($input, $rules, $msg);
        if($validate->fails()) {
            return Helper::jsonData(202, $validate->errors()->first());
        }

        $info = User::where('mobile', $mobile)->where('password', md5($password))->first();
        if (!$info) {
            return Helper::jsonData(202, '账号或者密码错误');
        }

        if ($info['status'] == 2) {
            return Helper::jsonData(205, '账号已冻结 请联系管理员处理');
        }

        $jwt = JwtCheck::getInstance();
        $token = $jwt->setUid($info['id'])->encode()->getToken();
        return Helper::jsonData(200, '登录成功！', ['token' => $token]);
    }

    /**
     * 忘记密码 第一步
     * mobile  手机号
     * code 验证码
     */
    public function modifyPassStepOne(Request $request)
    {
        $input = $request->all();
        $mobile = $request->get('mobile');
        $code = $request->get('code');
        $rules = [
            'mobile' => 'required|regex:/^1\d{10}$/',
            'code' => 'required'
        ];
        $msg = [
            'mobile.required' => '手机号码不能为空',
            'mobile.regex' => '手机格式不正确',
            'code.required' => '验证码不能为空',
        ];

        $validate = Validator::make($input, $rules, $msg);
        if($validate->fails()) {
            return Helper::jsonData(202, $validate->errors()->first());
        }

        if (!$parent_info = User::where('mobile', $mobile)->first()) {
            return Helper::jsonData(202, '账号不存在');
        }

        if (!$code) {
            return Helper::jsonData(202, '验证码不正确');
        }
        $res = $this->checkSmsCode($mobile,$code,'modify');
        if ($res[0] != 200) {
            return Helper::jsonData(202,$res[1]);
        }

        return Helper::jsonData(200, '验证通过 请前往设置密码...');
    }


    /**
     * @param Request $request
     * 忘记密码第二步
     */
    public function modifyPassStepTwo(Request $request)
    {
        $input = $request->all();
        $password = $request->get('password');
        $repassword = $request->get('repassword');
        $mobile = $request->get('mobile');
        $code = $request->get('code');

        $rules = [
            'mobile' => 'required|regex:/^1\d{10}$/',
            'code' => 'required',
            'password' => 'required',
        ];
        $msg = [
            'mobile.required' => '手机号码不能为空',
            'mobile.regex' => '手机格式不正确',
            'code.required' => '验证码不能为空',
            'password.required' => '密码不能为空',
        ];

        $validate = Validator::make($input, $rules, $msg);
        if($validate->fails()) {
            return Helper::jsonData(202, $validate->errors()->first());
        }

        $info = User::where('mobile', $mobile)->first();
        if (!$info) {
            return Helper::jsonData(202, '账号不存在');
        }

        if ($password != $repassword) {
            return Helper::jsonData(202, '两次密码输入不一致');
        }

        if (!$code) {
            return Helper::jsonData(202, '验证码不正确');
        }
        $res = $this->checkSmsCode($mobile,$code,'modify');
        if ($res[0] != 200) {
            return Helper::jsonData(202,$res[1]);
        }

        $data = User::where('id', $info['id'])->update(['password' => md5($password)]);
        $this->delCode($mobile,$code,'modify');
        return Helper::jsonData(200,'密码修改成功 请前往登录');
    }

    /**
     * @param Request $request
     * 城市 + 平台
     */
    public function cityTerrace(Request $request)
    {
        $list = City::where('status',1)->get()->toArray();
        $items = [];
        foreach ($list as $k => $val) {
            $terrace = Terrace::whereIn('id', explode(',',$val['terrace_ids']))->get(['id', 'name'])->toArray();
            $items[] = [
                'city_id' => $val['id'],
                'name' => $val['name'],
                'terrace' => $terrace,
            ];
        }
        return Helper::jsonData(200, '信息获取成功！',['list' => $items]);
    }
    /**
     * 辅助函数
     */
    public function uploadImage($fileCharater,$filename_path)
    {
        //获取文件的扩展名
        $ext = $fileCharater->getClientOriginalExtension();
        //获取文件的绝对路径
        $path = $fileCharater->getRealPath();
        //定义文件名
        $filename = $filename_path.'.'.$ext;
        Storage::disk('admin')->put($filename, file_get_contents($path));
    }

    /**
     * 发送短信验证码
     * mobile 手机号
     * type   类型  reg 注册  modify修改密码  notice 通知类短信
     */
    public function sendSmsCode(Request $request)
    {
        $sign = '241875';
        $templateId = '205558';
        $exp = '20';
        $mobile = $request->get('mobile');
        $type = $request->get('type');

        if (!$mobile ) {
            return Helper::jsonData(202, '手机号不能为空');
        }
        if (!$type) {
            return Helper::jsonData(202,'短信类型有误');
        }
        $code = rand('100000','999999');

        $result = Helper::sendSmsCode($mobile,$code,$sign,$templateId);
        // 刪除所有过期的二维码
        SendCode::where('exp_time', '<', time())->delete();
        if ($result) {
            SendCode::where('mobile',$mobile)->where('type',$type)->delete();
            $data = [
                'mobile' => $mobile,
                'code' => $code,
                'type' => $type,
                'exp_time' => time() + ($exp*60),
                'created_at' => time(),
            ];
            SendCode::create($data);
            return Helper::jsonData(200, '短信发送成功！');
        }else{
            return Helper::jsonData(202,'短信发送失败！');
        }
    }

    /**
     * 检查短信验证码是否存在  并看是否过期
     *
     */
    public function checkSmsCode($mobile, $code, $type)
    {
        $info = SendCode::where('mobile',$mobile)->where('code', $code)->where('type',$type)->first();
        if (!$info) {
            return [202,'不存在的验证码'];
        }

        if ($info['exp_time'] < time()) {
            return [202, '验证码已过期'];
        }

        return [200, '验证成功！'];
    }

    /**
     * 删除验证码
     */
    public function delCode($mobile, $code, $type)
    {
        $del = SendCode::where('mobile',$mobile)->where('code', $code)->where('type',$type)->delete();
    }
}
