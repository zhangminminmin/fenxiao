<?php

namespace App\admin\Actions\Test;

use App\Models\City;
use App\Models\Terrace;
use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;
use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;
class Terracedel extends RowAction
{
    protected $selector = '.terracedel';
    public $name = "删除";
    public function handle(Model $model,Request $request)
    {
        $id = $request->get('_key');
        $info = City::where('id', '>', 0)->whereRaw('FIND_IN_SET(' . $id . ',terrace_ids)',true)->first();
        if ($info) {
            return $this->response()->error('此平台已被城市绑定 请先解除绑定再删除')->refresh();
        }
        Terrace::where('id', $id)->delete();
        return $this->response()->success('刪除成功')->refresh();
    }

    public function html()
    {
        return <<<HTML
        <a class="btn btn-sm btn-default terracedel"></a>
HTML;
    }
    public function dialog()
    {
        $this->confirm('确定删除此平台？');
    }
}
