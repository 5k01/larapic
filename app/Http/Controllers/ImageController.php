<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Image;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class ImageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function create()
    {
        return view('image.create');
    }

    public function save(Request $request)
    {
        $user = \Auth::User();


        // $validate = $this->validate($request, [
        //     'description' => ['required'],
        //     'image_path' => ['required|image']
        // ]);

        $description = $request->input('description');
        $img = new Image();
        $img->user_id = $user->id;
        $img->description = $description;

        $image_path = $request->file('image_path');
        if ($image_path) {
            $image_path_name = time() . $image_path->getClientOriginalName();
            Storage::disk('images')->put($image_path_name, File::get($image_path));
            $img->image_path = $image_path_name;
        }

        $img->save();

        return redirect()->route('home')->with([
            'message' =>  'La foto ha sido compartida',
        ]);
    }

    public function getImage($filename)
    {
        $file = Storage::disk('images')->get($filename);
        return new Response($file, 200);
    }
}
