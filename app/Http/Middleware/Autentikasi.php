<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Autentikasi{
    public function handle(Request $request, Closure $next): Response
    {
        $session        =   $request->session();
        $userSession    =   $session->get('administrator');
        if(empty($userSession)){
            return redirect()->route('admin.login');
        }

        $accesedPath    =   $request->path();
        $authPaths      =   ['login', 'lupa-password'];
        if(in_array($accesedPath, $authPaths)){
            return redirect()->route('/');
        }

        return $next($request);
    }
}
