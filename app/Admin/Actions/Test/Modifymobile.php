<?php

namespace App\admin\Actions\Test;

use App\Models\User;
use Encore\Admin\Actions\Action;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Encore\Admin\Actions\RowAction;
class Modifymobile extends RowAction
{
    protected $selector = '.modifymobile';
    public $name = '修改手机号';
    public function handle(Model $model ,Request $request)
    {
        $mobile = $request->get('mobile');
        $id = $request->get('_key');
        if ($mobile) {
            $info = User::where('mobile', $mobile)->where('id', '<>', $id)->first();
            if ($info) {
                return $this->response()->error('手机号已存在 ' . $id)->refresh();
            }else{
                $data = [
                    'mobile' => $mobile,
                ];
                User::where('id', $id)->update($data);
                return $this->response()->success('手机号修改成功！')->refresh();

            }
        }else{
            return $this->response()->error('手机号码未修改')->refresh();
        }
    }

    public function form()
    {
        $this->text('mobile', '手机号');
    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default modifymobile"></a>
HTML;
    }
}
