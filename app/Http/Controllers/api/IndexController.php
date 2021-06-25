<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\lib\Helper;
use App\Models\Banner;
use App\Models\Flow;
use App\Models\Notice;
use App\Models\Order;
use App\Models\Terrace;
use App\Models\User;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use App\lib\JwtCheck;
use Illuminate\Support\Facades\DB;

class IndexController extends Controller
{
    /**
     * @param Request $request
     * 网站配置信息
     */
    public function baseConfig()
    {
        $param = [
            'kefu_path' => config('base.kefu_path'),
            'kefu_mobile' => config('base.kefu_mobile'),
            'kefu_code' => env('APP_URL') . '/storage/' . config('base.kefu_code'),
            'register_deal' => config('uplaod.register_deal'),
            'user_deal' => config('uplaod.user_deal'),
            'about_us' => config('uplaod.about_us'),
            'ios_path' => config('base.ios_path'),
            'andr_path' => config('base.andr_path'),
            'versions' => config('base.versions_code'),
        ];
        return Helper::jsonData(200,'数据获取成功！',$param);
    }
    /*
     * 首页
     */
    public function homePage(Request $request)
    {
        $uid = JwtCheck::getInstance()->getUid();
        $userInfo = User::where('id', $uid)->first();// 我的信息
        // 我的一级会员 二级会员个数
        $son_count = User::where('parent_id', $userInfo['id'])->count();
        $son_count_two = User::where('parent_two_id', $userInfo['id'])->count();
        //我的一级会员日流水 和 月流水金额
        $one_user = array_column(User::where('parent_id', $userInfo['id'])->get()->toArray(),'id');
        $one_user_day = Order::whereIn('user_id', $one_user)->whereDate('time',date('Y-m-d'))->sum('money');
        $one_user_month = Order::whereIn('user_id', $one_user)->whereYear('time',date('Y'))->whereMonth('time',date('m'))->sum('money');
        //我的二级员日流水 和 月流水金额
        $one_user = array_column(User::where('parent_two_id', $userInfo['id'])->get()->toArray(),'id');
        $two_user_day = Order::whereIn('user_id', $one_user)->whereDate('time',date('Y-m-d'))->sum('money');
        $two_user_month = Order::whereIn('user_id', $one_user)->whereYear('time',date('Y'))->whereMonth('time',date('m'))->sum('money');
        // 平台推荐
        $terracelist = Terrace::where('status',2)->get(['id', 'image', 'name', "path",'notice_info']);
        //底部banner
        $bannerList = Banner::where('id', '>', 0)->get(['image','path']);
        $param = [
            'top_banner' => env('APP_URL') . '/storage/' . config('base.banner'),
            'total_money' => isset($userInfo['total_money']) ? $userInfo['total_money'] : 0,
            'money' => isset($userInfo['money']) ? $userInfo['money'] : 0,
            'son_count' => $son_count,
            'son_count_two' => $son_count_two,
            'one_user_day' => $one_user_day,
            'one_user_month' => $one_user_month,
            'two_user_day' => $two_user_day,
            'two_user_month' => $two_user_month,
            'terracelist' => $terracelist,
            'bannerList' => $bannerList,
        ];

        return Helper::jsonData(200, '信息获取成功！',$param);
    }

    /**
     * 累计佣金
     * 开始时间 stime
     * 结束时间 etime
     */
    public function myCommission(Request $request)
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $limit = $request->get('limit');
        $stime = $request->get('stime');
        $etime = $request->get('etime');

        $limit = intval($limit) ? $limit : 10;
        $flow = new Flow();
        $where = [];
        if ($stime) {
            $stime = strtotime($stime . " 00:00:00");
            $where[] = ['created_at', '>=', $stime];
        }
        if ($etime) {
            $etime = strtotime($etime . " 23:59:59");
            $where[] = ['created_at', '<=', $etime];
        }
        $list = $flow->where('user_id',$user_id)->where('type',1)->where($where)->paginate($limit);
        $items = [];
        foreach ($list as $k => $val) {
            $info = User::where('id', $val->afford_user_id)->first();
            $items[] = [
                'id' => $val->id,
                'level' => $val->level,
                'money' => $val->money,
                'realname' => mb_substr($info['realname'],0,1,'utf-8') . "*",
            ];
        }
        $param = [
            'list' => $items,
        ];
        return Helper::jsonData(200, '信息获取成功！', $param);
    }

    /**
     * 提现申请
     * money 提现申请
     * realname 姓名
     * alipaycode 支付宝名称
     */
    public function subWithdrawal(Request $request)
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $userInfo = User::where('id', $user_id)->first();

        $money = $request->get('money');
        $realname = $request->get('realname');
        $alipaycode = $request->get('alipaycode');

        if (!is_numeric($money) || $money <= 0) {
            return Helper::jsonData(202, '提现金额为数字且大于零');
        }
        if ($money > $userInfo['money']) {
            return Helper::jsonData(202, '可提现金额不足 请刷新查看金额');
        }

        if (!$realname) {
            return Helper::jsonData(202, '请填写姓名');
        }

        if (!$alipaycode) {
            return Helper::jsonData(202, '支付宝账号不能为空');
        }
        //生成提现记录  生成流水
        DB::beginTransaction();
        try {
            $data = [
                'money' => $money,
                'realname' => $realname,
                'alipaycode' => $alipaycode,
                'status' => 1,
                'user_id' => $user_id,
            ];
            $w = Withdrawal::create($data);
            if (!$w) {
                throw new \Exception('网络错误 提现失败');
            }
            $flow = [
                'user_id' => $user_id,
                'money' => $money,
                'type' => 2,
            ];
            $f = Flow::create($flow);
            if (!$f) {
                throw new \Exception('网络失败 提现失败');
            }
            // 減去會員表的值
            $decre = User::where('id', $user_id)->decrement('money', $money);
            if (!$decre) {
                throw new \Exception('网络原因 提现金额扣减失败');
            }
            DB::commit();
        }catch(\Exception $e) {
            DB::rollBack();
            return Helper::jsonData(202, $e->getMessage());
        }
        return Helper::jsonData(200, '提现成功！等待后台审核');
    }

    /**
     * 提现记录列表
     * page  当前页数
     * limit 每页展示条数
     * stime
     * etime
     */
    public function withdrawal(Request $request)
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $limit = $request->get('limit');
        $stime = $request->get('stime');
        $etime = $request->get('$etime');

        $where = [];
        if ($stime) {
            $stime = strtotime($stime . " 00:00:00");
            $where[] = ['created_at', '>=', $stime];
        }
        if ($etime) {
            $etime = strtotime($etime . " 23:59:59");
            $where[] = ['created_at', '<=', $etime];
        }
        $list = Withdrawal::where($where)->where('user_id', $user_id)->paginate($limit);
        $items = [];
        foreach ($list as $k => $val) {
            $items[] = [
                'realname' => $val->realname,
                'alipaycode' => $val->alipaycode,
                'money' => $val->money,
                'created_at' => $val->created_at,
                'status' => $val->status,
            ];
        }
        $param = [
            'list' => $items,
        ];
        return Helper::jsonData(200, '提现信息获取成功',$param);
    }
    /**
     * 我的团队 流水
     * page
     * limit
     * type 1 一级日流水 2 一级月流水 3 二级日流水 4二级月流水
     * name 平台名称
     * stime 开始时间
     * etime 结束时间
     *
     */
    public function mySonOrder(Request $request)
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $userInfo = User::where('id', $user_id)->first();

        $input = $request->all();
        $type = $request->get('type');
        $name = $request->get('name');
        $stime = $request->get('stime');
        $etime = $request->get('etime');
        $limit = $request->get('limit');

        $order = Order::query();
        if ($name) {
            $order->where('terrace', 'like', "%" . $name . "%");
        }

        switch ($type) {
            case 1:
                $ids = array_column(User::where('parent_id', $userInfo['id'])->get()->toArray(),'id');
                $ids = array_column(User::where('parent_id', $userInfo['id'])->get()->toArray(),'id');
                if ($stime || $etime) {
                    if ($stime) {
                        $stime = strtotime($stime . " 00:00:00");
                        $order->where('format_time','>=',$stime)->whereIn('user_id', $ids);
                    }
                    if ($etime) {
                        $etime = strtotime($etime . " 23:59:59");
                        $order->where('format_time','<=',$etime)->whereIn('user_id', $ids);
                    }
                }else{
                    $order->whereIn('user_id', $ids)->whereDate('time',date('Y-m-d'));
                }
                break;
            case 2:
                $ids = array_column(User::where('parent_id', $userInfo['id'])->get()->toArray(),'id');
                if ($stime || $etime) {
                    if ($stime) {
                        $stime = strtotime($stime . " 00:00:00");
                        $order->where('format_time','>=',$stime)->whereIn('user_id', $ids);
                    }
                    if ($etime) {
                        $etime = strtotime($etime . " 23:59:59");
                        $order->where('format_time','<=',$etime)->whereIn('user_id', $ids);
                    }
                }else{
                    $order->whereIn('user_id', $ids)->whereYear('time',date('Y'))->whereMonth('time',date('m'));
                }
                break;
            case 3:
                $ids = array_column(User::where('parent_two_id', $userInfo['id'])->get()->toArray(),'id');
                if ($stime || $etime) {
                    if ($stime) {
                        $stime = strtotime($stime . " 00:00:00");
                        $order->where('format_time','>=',$stime)->whereIn('user_id', $ids);
                    }
                    if ($etime) {
                        $etime = strtotime($etime . " 23:59:59");
                        $order->where('format_time','<=',$etime)->whereIn('user_id', $ids);
                    }
                }else{
                    $order->whereIn('user_id', $ids)->whereDate('time',date('Y-m-d'));
                }
                break;
            case 4:
                $ids = array_column(User::where('parent_two_id', $userInfo['id'])->get()->toArray(),'id');
                if ($stime || $etime) {
                    if ($stime) {
                        $stime = strtotime($stime . " 00:00:00");
                        $order->where('format_time','>=',$stime)->whereIn('user_id', $ids);
                    }
                    if ($etime) {
                        $etime = strtotime($etime . " 23:59:59");
                        $order->where('format_time','<=',$etime)->whereIn('user_id', $ids);
                    }
                }else{
                    $order->whereIn('user_id', $ids)->whereYear('time',date('Y'))->whereMonth('time',date('m'));
                }
                break;
            default:
                return Helper::jsonData(202, '参数错误 请刷新重试！');
                break;
        }

        $list = $order->paginate($limit);
        $items = [];
        foreach($list as $k => $val) {
            $items[] = [
                'id' => $val->id,
                'realname' => mb_substr($val->realname,0,1) . "*",
                'terrace' => $val->terrace,
                'money' => $val->money,
                'created_at' => $val->time,
            ];
        }
        $param = [
            'list' => $items
        ];
        return Helper::jsonData(200,'数据获取成功！',$param);
    }

    /**
     * 我的一級二級 月度排行榜
     * 我的月度排行榜
     * type 1 一级月  2二级月
     * stime 选择月 格式 2020-12
     * terrace_name 选择的平台
     */
    public function mySonOrderSort(Request $request)
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $userInfo = User::where('id', $user_id)->first();

        $input = $request->all();
        $type = $request->get('type');
        $stime = $request->get('stime');
        $terrace_name = $request->get('terrace_name');

        if (!$terrace_name) {
            return Helper::jsonData(202, '请选择平台');
        }
        $order = Order::query();
        $order->where('terrace',$terrace_name);
        switch ($type) {
            case 1:
                $ids = array_column(User::where('parent_id', $userInfo['id'])->get()->toArray(),'id');
                break;
            case 2:
                $ids = array_column(User::where('parent_two_id', $userInfo['id'])->get()->toArray(),'id');
                break;
            default :
                return Helper::jsonData(202, '参数错误');
                break;
        }

        if ($stime) {
            $year = date('Y',strtotime($stime . '-01' . " 00:00:00"));
            $month = date('m',strtotime($stime . '-01' . " 00:00:00"));
            $order->whereIn('user_id', $ids)->whereYear('time',$year)->whereMonth('time',$month);
        }else{
            $order->whereIn('user_id', $ids)->whereYear('time',date('Y'))->whereMonth('time',date('m'));
        }

        $list = $order->leftJoin('user', 'order.user_id','=','user.id')
            ->select(DB::raw('order.user_id,sum(order.money) as sum_money, user.realname'))
            ->groupBy('order.user_id')
            ->orderBy('sum_money','desc')
            ->limit(10)
            ->get();

        $items = [];
        foreach ($list as $k => $val) {
            $items[] = [
                'user_id' => $val->user_id,
                'sum_money' => $val->sum_money,
                'realname' => substr($val->realname,0,1)
            ];
        }
        $param = [
            'list' => $items
        ];
        return Helper::jsonData(200, '数据获取成功！',$param);
    }
    /**
     * 平台搜索数据
     */
    public function terrace()
    {
        $list = Terrace::where('id', '>', 0)->get(['id','name']);
        $param = [
            'list' => $list,
        ];
        return Helper::jsonData(200,'数据获取成功！',$param);
    }
    /**
     * 公告列表
     * page
     * limit
     */
    public function noticeList(Request $request)
    {
        $input = $request->all();
        $limit = isset($input['limit']) ? $input['limit'] : 20;
        $list = Notice::where('id', '>',0)->paginate($limit);
        $items = [];
        foreach ($list as $k => $val) {
            $items[] = [
                'id' => $val->id,
                'title' => $val->title,
                'description' => $val->description,
                'created_at' => $val->created_at,
            ];
        }
        return Helper::jsonData(200, '信息获取成功！',$items);

    }

    /**
     * 公告详情
     * id  公告的id
     */
    public function noticeInfo(Request $request)
    {
        $input = $request->all('id');
        if (!$input['id']) {
            return Helper::jsonData(202, '参数错误 请刷新重试！');
        }

        $info = Notice::where('id',  $input['id'])->first();
        if (!$info) {
            return Helper::jsonData(202, '新闻内容已经删除或者下架');
        }
        $param = [
            'info' => [
                'id' => $info['id'],
                'title' => $info['title'],
                'content' => $info['content'],
                'created_at' => $info['created_at'],
            ]
        ];
        return Helper::jsonData(200,'详情信息获取成功！', $param);
    }

    /**
     * 个人中心用户数据
     */
    public function userData()
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $userInfo = User::where('id', $user_id)->first();// 我的信息

        $param = [
            'user' => [
                'avatar' => $userInfo['avatar'] ? env('APP_URL') . '/storage/' . $userInfo['avatar'] : env('APP_URL') . '/storage/images/user.png',
                'realname' => $userInfo['realname'],
                'mobile' => $userInfo['mobile'],
                'front_card' => env('APP_URL') . '/storage/' . $userInfo['front_card'],
                'back_card' => env('APP_URL') . '/storage/' . $userInfo['back_card'],
                'hand_card' => env('APP_URL') . '/storage/' . $userInfo['hand_card'],
            ],
        ];
        return Helper::jsonData(200, '个人信息获取成功！',$param);
    }

    /***
     * 个人中心修改密码
     *
     */
    public function modifyMyPassword(Request $request)
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $userInfo = User::where('id', $user_id)->first();

        $password = $request->get('password');
        $newpassword = $request->get('newpassword');
        $renewpassword = $request->get('renewpassword');

        if (md5($password) != $userInfo->password) {
            return Helper::jsonData(202, '原始密码错误');
        }

        if (strlen($newpassword) < 6) {
            return Helper::jsonData(202, '密码至少为六位数');
        }
        if ($newpassword != $renewpassword) {
            return Helper::jsonData(202,'两次密码输入不一致！');
        }

        $data = [
            'password' => md5($newpassword),
        ];
        User::where('id',$user_id)->update($data);
        return Helper::jsonData(200,'密码修改成功！');
    }

    /**
     * 个人中心fenxiang
     */
    public function sharePath()
    {
        $user_id = JwtCheck::getInstance()->getUid();
        $param = [
            'path' => env('APP_URL') . '/web?parent_id=' . $user_id,
        ];
        return Helper::jsonData(200, '分享链接获取成功！',$param);
    }
}
