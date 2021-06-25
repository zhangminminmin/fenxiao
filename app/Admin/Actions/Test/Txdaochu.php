<?php

namespace App\Admin\Actions\Test;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use App\Models\Withdrawal;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

class Txdaochu extends Action
{
    protected $selector = '.txdaochu';

    public function handle(Request $request)
    {
        $input = $request->all();

        if (!$input['stime'] || !$input['etime']) {
            return $this->response()->error('请输入开始时间和结束时间');die;
        }
        $withdrawal = Withdrawal::query();
        $stime = strtotime($input['stime']);
        $etime = strtotime($input['etime']);
        if ($input['status']) {
            $withdrawal->where('status',$input['status']);
        }
        $list = $withdrawal->where('created_at', '>', $stime)->where('created_at', '<', $etime)->get();
        if (!$list) {
            return $this->response()->error('导出数据为空');
        }

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $styleArray = [
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ];
        $sheet->getStyle('A:E')->applyFromArray($styleArray);

        $sheet->getColumnDimension('A')->setWidth(20);
        $sheet->getColumnDimension('B')->setWidth(50);
        $sheet->getColumnDimension('C')->setWidth(50);
        $sheet->getColumnDimension('D')->setWidth(50);
        $sheet->getColumnDimension('E')->setWidth(50);

        $sheet->setCellValue('A1', '提现金额');//新文件需要设置头部
        $sheet->setCellValue('B1', '姓名');
        $sheet->setCellValue('C1', '支付宝账号');
        $sheet->setCellValue('D1', '状态');
        $sheet->setCellValue('E1', '提现时间');

        $file = 'storage/images/' . time(). '.xlsx';
        $row = 1;//记录行数
        foreach ($list as $key => $value) {// 写入数据
            $sheet->setCellValue('A'.($row+1), $value->money);
            $sheet->setCellValue('B'.($row+1), $value->realname);
            $sheet->setCellValue('C'.($row+1), $value->alipaycode);
            $sheet->setCellValue('D'.($row+1), $value->status ==1 ? "审核中" :'已审核');
            $sheet->setCellValue('E'.($row+1), $value->created_at);
            $row++;
        }
        $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
        $writer->save($file);

//        header("Content-type:   application/octet-stream");
//        header("Accept-Ranges:   bytes ");
//        header("Accept-Length: " . filesize($file));
//        header("Content-Disposition: attachment;   filename= " . date('YmdHis') . '.xlsx');
//        readfile($file);
        return $this->response()->success('导出成功！')->download(env('APP_URL') . '/' . $file);
    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default txdaochu">导出数据</a>
HTML;
    }

    public function form()
    {
        $status = [
            0 => '全部',
            1 => '未审核',
            2 => '已审核',
        ];
        $this->datetime('stime', '开始时间');
        $this->datetime('etime', '结束时间');
        $this->select('status', '审核状态')->options($status);
    }
}
