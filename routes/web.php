<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    $home =  $router->app->version();
    $home = $home . "</br></br> <a href='/getPostmanConfig'>Download postman config</a>";
    return $home;
});

$router->group(['prefix' => 'api'], function() use($router) {
    $router->post('/member/register', 'MemberController@doMemberRegister');
    $router->post('/member/login', 'MemberController@doMemberLogin');


    $router->group(['middleware' => "auth"], function($router) {
        $router->get('/member/getIslands', 'MemberactionController@getIslands');
    });
});

$router->get('/getPostmanConfig', 'Controller@getPostmanConfig');