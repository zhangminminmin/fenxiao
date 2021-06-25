<?php

namespace App\admin\Actions\Test;

use App\Models\User;
use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Doaccount extends RowAction
{
    protected $selector = '.doaccount';
    public $name = '冻结/解冻账号';
    public function handle(Model $model,Request $request)
    {
        $id = $request->all('_key');
        $info = User::where('id', $id)->first();
        if ($info['status'] == 1) {
            $data = [
                'status' => 2
            ];
            User::where('id', $id)->update($data);
            return $this->response()->success('账号冻结成功')->refresh();
        }else{
            $data = [
                'status' => 1
            ];
            User::where('id', $id)->update($data);
            return $this->response()->success('账号解冻成功')->refresh();
        }

    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default doaccount"></a>
HTML;
    }
}
