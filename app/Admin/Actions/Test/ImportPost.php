<?php

namespace App\Admin\Actions\Test;

use App\Models\Admininfo as AdminInfo;
use App\Models\Flow;
use App\Models\Order;
use App\Models\User;
use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Reader\Xls;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Illuminate\Support\Facades\DB;

class ImportPost extends Action
{
    protected $selector = '.import-post';

    public function handle(Request $request)
    {
        $file = $request->file('file',0);
        //获取文件的扩展名
        $ext = $file->getClientOriginalExtension();

        if('csv' == $ext) {
            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
        } else if ('xlsx' == $ext){
            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
        }else{
            $reader = new Xls();
        }

        $spreadsheet = $reader->load($_FILES['file']['tmp_name']);
        $sheetData = $spreadsheet->getActiveSheet()->ToArray();
        unset($sheetData[0]);
        $sheetData = array_values(array_filter($sheetData, function($res){return ($res[1] && $res[2]);})); //获取所有数据并过滤
        $result = $this->disposeData($sheetData);
        if ($result[0] == 200) {
            return $this->response()->success($result[1])->refresh();
        }else{
            return $this->response()->error($result[1])->refresh();
        }
    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default import-post">导入数据</a>
HTML;
    }

    // 导入文件
    public function form()
    {
        $this->file('file', '请选择文件')->rules('mimes:xls,xlsx',['mimes' => '不合法的文件格式 文件格式xls 或者 xls']);
    }

    /**
     * 輔助函數
     */
    public function disposeData($sheetData)
    {
        DB::beginTransaction();
        try {
            foreach ($sheetData as $k => $val) {
                $info = User::where('realname',$val[0])->where('mobile',$val[2])->where('terrace_names','like', "%" . $val[4] . "%")->where('city',$val[5])->first();
                if ($info) {
                    $order = Order::where('realname', $val[0])->where('mobile',$val[2])->where('terrace', '=' , $val[4])->where('city',$val[5])->where('time', $val[3])->first();
                    if (!$order) {
                        // 保存数据
                        $data = [
                            'user_id' => $info['id'],
                            'realname' => $val[0],
                            'money' => $val[1],
                            'mobile' => $val[2],
                            'time' => $val[3],
                            'format_time' => strtotime($val[3]),
                            'terrace' => $val[4],
                            'city' => $val[5]
                        ];
                        $insertOrder = Order::create($data);
                        if (!$insertOrder) {
                            throw new \Exception('网络异常');
                        }
                        // 查看是否有上級  返佣二级  以及返佣 加上流水
                        if ($info['parent_id']) {
                            $parent_rate = (AdminInfo::where('name', 'base.parent_id')->value('value')) / 100;
                            $money = sprintf('%.2f', $parent_rate * $val[1]);
                            if ($money > 0) {
                                $addMoney = User::where('id', $info['parent_id'])->increment('money', $money);
                                $addMoney_t = User::where('id', $info['parent_id'])->increment('total_money', $money);
                                $flow = [
                                    'user_id' => $info['parent_id'],
                                    'money' => $money,
                                    'afford_user_id' => $info['id'],
                                    'type' => 1,
                                    'level' => 1,
                                    'created_at' => time(),
                                    'terrace_name' => $val[4],
                                ];
                                $f = Flow::create($flow);
                                if (!$f) {
                                    throw new \Exception('网络异常');
                                }
                            }

                        }

                        if ($info['parent_two_id']) {
                            $parent_two_rate = AdminInfo::where('name', 'base.parent_two_id')->value('value') / 100;
                            $money = sprintf('%.2f', $parent_two_rate * $val[1]);
                            if ($money > 0) {
                                $addMoney = User::where('id', $info['parent_two_id'])->increment('money', $money);
                                $addMoney_t = User::where('id', $info['parent_two_id'])->increment('total_money', $money);
                                $flow = [
                                    'user_id' => $info['parent_two_id'],
                                    'money' => $money,
                                    'afford_user_id' => $info['id'],
                                    'type' => 1,
                                    'level' => 2,
                                    'created_at' => time(),
                                    'terrace_name' => $val[4],
                                ];
                                $f = Flow::create($flow);
                                if (!$f) {
                                    throw new \Exception('网络异常');
                                }
                            }
                        }
                    }
                }
            }
            DB::commit();
            return [200,'导入成功！'];
        }catch(\Exception $e){
            DB::rollBack();
            return [202, $e->getMessage()];
        }


    }
}
