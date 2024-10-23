<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class RegisterController extends Controller
{
    public function register(Request $request) {

        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'email' => 'email|required|unique:users,email',
            'password' => 'required'
        ]);

        $validatedData['password'] = Hash::make($request->password);

        $user = User::create($validatedData);

        return response()->json(['user' => $user, 'message' => 'User registered successfully']);
    }

}
