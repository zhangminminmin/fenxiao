<?php

namespace App\Admin\Controllers;

use App\Models\Order;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Admin\Actions\Test\ImportPost;
class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '数据管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order());

        $grid->column('id', __('Id'));
        $grid->column('realname', '姓名');
        $grid->column('money', '订单金额');
        $grid->column('mobile', __('手机号'));
        $grid->column('time', __('时间'));
        $grid->column('terrace', __('平台名称'));
        $grid->column('city', __('注册城市'));

        // 增加操作按鈕
        $grid->tools(function(Grid\Tools $tools) {
            return $tools->append(new ImportPost());
        });

        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableEdit();
        });
        $grid->filter(function($filter){
            // 在这里添加字段过滤器
            $filter->like('realname', '姓名');
            $filter->like('mobile', '手机号');
            $filter->like('city', '城市');

        });
        //
        $grid->disableExport();
        $grid->disableCreation();
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Order::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('realname', __('姓名'));
        $show->field('money', __('订单金额'));
        $show->field('mobile', __('手机号'));
        $show->field('time', __('时间'));
        $show->field('terrace', __('平台名称'));
        $show->field('city', __('城市'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Order());

        $form->text('realname', __('Realname'));
        $form->decimal('money', __('Money'));
        $form->mobile('mobile', __('Mobile'));
        $form->text('time', __('Time'));
        $form->number('format_time', __('Format time'));
        $form->text('terrace', __('Terrace'));
        $form->text('city', __('City'));

        return $form;
    }
}
