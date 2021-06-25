<?php

namespace App\Admin\Controllers;

use App\admin\Actions\Test\Daochu;
use App\admin\Actions\Test\Modifymobile;
use App\Models\User;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\admin\Actions\Test\Doaccount;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '会员数据';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new user());

        $grid->column('id', __('Id'))->sortable();
        $grid->column('mobile', __('手机号'))->style('text-align:center');
        $grid->column('city', __('城市'))->style('text-align:center');
        $grid->column('terrace_names', __('平台'));
        $grid->column('realname', __('姓名'));
        $grid->column('front_card', __('身份证正面照'))->image()->style('text-align:center');
        $grid->column('back_card', __('身份证反面照'))->image()->style('text-align:center');
        $grid->column('hand_card', __('手持身份证'))->image()->style('text-align:center');
        $grid->column('parent_id', __('上级id'))->style('text-align:center');
        $grid->column('status', __('状态'))->display(function ($released) {
            return $released == 1 ? '正常' : '冻结';
        })->style('text-align:center');
        $grid->column('money', __('佣金'))->style('text-align:center');
        $grid->column('created_at', __('创建时间'))->style('text-align:center');
        $grid->disableExport();
        $grid->disableCreation();

        $grid->filter(function($filter){
            // 在这里添加字段过滤器
            $filter->like('realname', '姓名');
            $filter->like('mobile', '手机号');
            $filter->like('city', '城市');

        });
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableEdit();
            $actions->add(new Modifymobile);
            $actions->add(new Doaccount());
        });
        $grid->model()->orderBy('id', 'desc');
        $grid->tools(function (Grid\Tools $tools) {
            $tools->append(new Daochu());
        });

        $script=<<<EOL
         $('.daochu2').on('click',function(){
             var realname = $('input[name=realname]').val();
             var mobile = $('input[name=mobile]').val();
             var city = $('input[name=city]').val();
             window.location.href='down?realname='+realname+'&mobile='+mobile+'&city='+city;
         });
EOL;

        Admin::script($script);
        return $grid;
    }

    public function down(Request $request)
    {
        $input = $request->all();
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->getColumnDimension('A')->setWidth(15);
        $sheet->setCellValue('A1', '手机号');//新文件需要设置头部
        $sheet->setCellValue('B1', '姓名');
        $sheet->setCellValue('C1', '城市');
        $sheet->setCellValue('D1', '平台');
        $sheet->setCellValue('E1', '佣金金额');

        $users = User::query();
        if ($input['realname']) {
            $users->where('realname', 'like', $input['realname']);
        }

        if ($input['mobile']) {
            $users->where('mobile', 'like', $input['mobile']);
        }

        if ($input['city']) {
            $users->where('city', 'like', $input['city']);
        }
        $userList = $users->where('id', '>', 0)->get();

        $file = 'storage/images/' . time(). '.xlsx';
        $row = 1;//记录行数
        foreach ($userList as $key => $value) {// 写入数据
            $sheet->setCellValue('A'.($row+1), $value->mobile);
            $sheet->setCellValue('B'.($row+1), $value->realname);
            $sheet->setCellValue('C'.($row+1), $value->city);
            $sheet->setCellValue('D'.($row+1), $value->terrace_names);
            $sheet->setCellValue('E'.($row+1), $value->money);
            $row++;
        }
        $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
        $writer->save($file);

        header("Content-type:   application/octet-stream");
        header("Accept-Ranges:   bytes ");
        header("Accept-Length: " . filesize($file));
        header("Content-Disposition: attachment;   filename= " . date('YmdHis') . '.xlsx');
        readfile($file);
        return Response()->success('123');
    }
    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(user::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('mobile', __('手机号'));
        $show->field('city', __('城市'));
        $show->field('terrace_names', __('平台'));
        $show->field('realname', __('姓名'));
        $show->front_card('身份证正面照')->image();
        $show->back_card('身份证反面照')->image();
        $show->hand_card('手持身份证照')->image();
        $show->field('parent_id', __('上级id'));
        $show->status()->using(['1' => '正常', '2' => '冻结']);
        $show->field('total_money', __('总佣金'));
        $show->field('money', __('可用佣金'));
        $show->field('created_at', __('创建时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new user());

        $form->mobile('mobile', __('Mobile'));
        $form->password('password', __('Password'));
        $form->text('city', __('City'));
        $form->number('city_id', __('City id'));
        $form->text('terrace_ids', __('Terrace ids'));
        $form->text('terrace_names', __('Terrace names'));
        $form->text('realname', __('Realname'));
        $form->text('front_card', __('Front card'));
        $form->text('back_card', __('Back card'));
        $form->text('hand_card', __('Hand card'));
        $form->number('parent_id', __('Parent id'));
        $form->number('parent_two_id', __('Parent two id'));
        $form->switch('status', __('Status'))->default(1);
        $form->decimal('total_money', __('Total money'))->default(0.00);
        $form->decimal('money', __('Money'))->default(0.00);

        return $form;
    }
}
