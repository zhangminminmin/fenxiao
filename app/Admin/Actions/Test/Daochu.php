<?php

namespace App\admin\Actions\Test;

use App\Models\User;
use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Daochu extends Action
{
    protected $selector = '.daochu';
    public function handle(Request $request)
    {

        return $this->response()->success('导出成功,正在下载！');
    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default daochu2">导出数据</a>
HTML;
    }

}
