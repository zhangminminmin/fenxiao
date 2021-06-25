<?php

namespace App\Http\Middleware;

use App\lib\Helper;
use App\Models\User;
use Closure;
use Firebase\JWT\JWT as jwtauth;
use App\lib\JwtCheck;
class Jwt
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = $request->header('Authorization');
        $key = 'fenxiao';
        try {
            $jwt = JwtCheck::getInstance();
            $payload = $jwt->setToken($token)->decode();
            $info = User::where('id', $jwt->getUid())->first();
            if ($info['status'] == 2) {
                throw new \Exception('账号已冻结 请联系平台管理员处理', 205);
            }
            return $next($request);
        }catch(\Exception $e){
            $code = $e->getCode() ? :202;
            return Helper::jsonData($code ,$e->getMessage());
        }
    }
}
