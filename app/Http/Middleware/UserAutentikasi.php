<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class UserAutentikasi{
    public function handle(Request $request, Closure $next): Response
    {
        $session        =   $request->session();
        $userSession    =   $session->get('user');
        if(empty($userSession)){
            return redirect()->route('user.login');
        }

        $accesedPath    =   $request->path();
        $authPaths      =   ['login', 'lupa-password'];
        if(in_array($accesedPath, $authPaths)){
            return redirect()->route('/');
        }

        return $next($request);
    }
}
