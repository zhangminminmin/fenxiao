<?php

namespace App\Admin\Controllers;

use App\admin\Actions\Test\Terracedel;
use App\Models\Terrace;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TerraceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '平台管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Terrace());

        $grid->column('id', __('Id'))->sortable()->style('text-align:center');
        $grid->column('image', __('平台图片'))->style('text-align:center')->image();
        $grid->column('name', __('平台名称'))->style('text-align:center');
        $grid->column('path', __('外链'))->style('text-align:center');
        $grid->column('notice_info', __('提示语'))->style('text-align:center');
        $grid->column('status', __('状态'))->display(function($status){
            return $status == 1 ? '未推荐' : '已推荐';
        })->style('text-align:center');
        $grid->column('created_at', __('创建时间'))->style('text-align:center');
        $grid->disableExport();

        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->add(new Terracedel());
        });
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
        $show = new Show(Terrace::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('image', __('平台图片'))->image();
        $show->field('name', __('平台名称'));
        $show->field('path', __('外链'));
        $show->field('notice_info', __('提示语'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Terrace());

        $form->image('image', __('平台图片'))->rules('required', ['required' => '平台图片不能为空']);
        $form->text('name', __('平台名称'))->rules('required', ['required' => '平台名称不能为空']);
        $form->text('path', __('外链'))->rules('required', ['required' => '平台外链不能为空']);
        $form->text('notice_info', __('提示语'))->rules('required', ['required' => '平台提示语不能为空']);
        $form->radio('status','状态')->options(['1' => '未推荐', '2'=> '已推荐'])->default(1);

        return $form;
    }
}
