<?php

namespace App\Admin\Controllers;

use App\Models\Notice;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class NoticerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '公告详情';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Notice());

        $grid->column('id', __('Id'))->sortable()->style('text-align:center');
        $grid->column('title', __('标题'))->style('text-align:center');
        $grid->column('description', __('描述'))->style('text-align:center');
        $grid->column('created_at', __('创建时间'))->style('text-align:center');
        $grid->disableExport();

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
        $show = new Show(Notice::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('标题'));
        $show->field('description', __('描述'));
        $show->field('content', __('内容'));
        $show->content()->unescape()->as(function ($body) {
            return "<pre>{$body}</pre>";
        });
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
        $form = new Form(new Notice());

        $form->text('title', __('标题'))->rules('required', ['required' => '标题为必填']);
        $form->textarea('description', __('描述'))->rules('required', ['required' => '描述为必填']);
        $form->UEditor('content', __('内容'))->rules('required', ['required' => '内容为必填']);

        return $form;
    }
}
