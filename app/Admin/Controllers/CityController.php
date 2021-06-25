<?php

namespace App\Admin\Controllers;

use App\Models\City;
use App\Models\Terrace;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CityController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '城市管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new City());

        $grid->column('id', __('Id'))->sortable()->style('text-align:center');
        $grid->column('name', __('城市名称'))->style('text-align:center');
        $grid->column('terrace_ids', __('平台'))->display(function($terrace_ids) {
            $names = '';
            if($terrace_ids) {
                $terrace_ids_arr = explode(',',$terrace_ids);
                $names = implode(',',array_column(Terrace::whereIn('id', $terrace_ids_arr)->get('name')->toArray(),'name'));
            }
            return $names;
        })->style('text-align:center');
        $grid->column('status', __('状态'))->display(function($status) {
            return $status == 1 ? '上架' : '下架';
        })->style('text-align:center');
        $grid->column('created_at', __('创建时间'))->style('text-align:center');
        $grid->disableExport();

        $grid->actions(function ($actions) {
            $actions->disableDelete();
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
        $show = new Show(City::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('城市'));
        $show->terrace_ids('平台')->as(function ($terrace_ids) {
            $names = '';
            if($terrace_ids) {
                $terrace_ids_arr = explode(',',$terrace_ids);
                $names = implode(',',array_column(Terrace::whereIn('id', $terrace_ids_arr)->get('name')->toArray(),'name'));
            }
            return "{$names}";
        });

        $show->status('状态')->as(function ($status) {
            return $status == 1 ? '上架' :'下架';
        });

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new City());

        $form->text('name', __('城市'))->rules('required', ['required' => '城市为必填']);
        $form->multipleSelect('terrace_ids', '平台')->options(Terrace::all()->pluck('name', 'id'))->rules('required', ['required' => '至少选择一个平台']);
        $form->radio('status','状态')->options(['1' => '上架', '2'=> '下架'])->default('1');

        return $form;
    }
}
