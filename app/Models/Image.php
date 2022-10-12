<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    // Tabla
    protected $table = 'images';

    // Relaciones
    // One to Many
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }

    // Many to One / belongs <- inverse 
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
