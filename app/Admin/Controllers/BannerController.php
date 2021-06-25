<?php

namespace App\Admin\Controllers;

use App\Models\Banner;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class BannerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Banner图管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Banner());

        $grid->column('id', __('Id'))->sortable()->style('text-align:center');
        $grid->column('image', __('banner'))->style('text-align:center')->image();
        $grid->column('path', __('外链'))->style('text-align:center');
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
        $show = new Show(Banner::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('image', __('banner'))->image();
        $show->field('path', __('外链'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Banner());

        $form->image('image', __('banner'))->rules('required', ['required' => '请上传图片']);
        $form->text('path', __('外链'))->rules('required', ['required' => '外链为必填']);

        return $form;
    }
}
