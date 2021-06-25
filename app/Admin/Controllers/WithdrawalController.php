<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Test\Txdaochu;
use App\Models\Withdrawal;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class WithdrawalController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '提现数据';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Withdrawal());

        $grid->column('id', __('Id'))->sortable()->style('text-align:center');
        $grid->column('money', __('提现金额'))->style('text-align:center');
        $grid->column('realname', __('姓名'))->style('text-align:center');
        $grid->column('alipaycode', __('支付宝状态'))->style('text-align:center');
        $grid->column('status', __('状态'))->display(function($status) {
            return $status == 1 ? '审核中' : '已审核';
        })->style('text-align:center');
        $grid->column('created_at', __('提现时间'))->style('text-align:center');
        $grid->disableExport();
        $grid->disableCreation();
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableEdit();
            $actions->add(new \App\admin\Actions\Test\Withdrawal());
        });
        $grid->tools(function (Grid\Tools $tools) {
            $tools->append(new Txdaochu());
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
        $show = new Show(Withdrawal::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('money', __('提现金额'));
        $show->field('realname', __('姓名'));
        $show->field('alipaycode', __('支付宝账号'));
        $show->field('status', __('状态'));
        $show->field('created_at', __('提现时间'));

        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Withdrawal());

        $form->number('user_id', __('User id'));
        $form->decimal('money', __('Money'));
        $form->text('realname', __('Realname'));
        $form->text('alipaycode', __('Alipaycode'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
