<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
//    Route::redirect('/', '/admin/users');
    $router->resource('users', UserController::class);
    $router->resource('orders', OrderController::class);
    $router->resource('withdrawals', WithdrawalController::class);
    $router->resource('notices', NoticerController::class);
    $router->resource('banners', BannerController::class);
    $router->resource('terraces', TerraceController::class);
    $router->resource('cities', CityController::class);
    $router->get('down', 'UserController@down');
});
