@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Compartir imagen</div>

                    <div class="card-body">
                        <form action="{{ route('image.save') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="form-group row">
                                <label for="image_path" class="col-md-3 col-form-label text-md-end">Imagen</label>
                                <div class="col-md-7">
                                    <input id="image_path" type="file"
                                        class="form-control @error('image_path') is-invalid @enderror" name="image_path"
                                        required>
                                    @if ($errors->has('image_path'))
                                        <span class="invalid-feedback " role="alert">
                                            <strong>{{ $errors->first('image_path') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <br />
                            <div class="form-group row">
                                <label for="description" class="col-md-3 col-form-label text-md-end">Descripción</label>
                                <div class="col-md-7">
                                    <textarea name="description" id="description" class="form-control" required> </textarea>
                                    @if ($errors->has('description'))
                                        <span class="invalid-feedback " role="alert">
                                            <strong>{{ $errors->first('description') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <br />

                            <div class="form-group row">
                                <div class="col-md-6  offset-md-3 ">
                                    <input type="submit" value="Compartir" class="btn btn-primary">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
