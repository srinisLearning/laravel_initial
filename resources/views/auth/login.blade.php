 <!DOCTYPE html>
 <html lang="en">

 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <!-- CSS only -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
     <!-- JavaScript Bundle with Popper -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
     <title>Login</title>
 </head>

 <body>
     <div class="container">
         <div class="row">
             <div class="col-md-4 col-md-offset-4" style='margin-top:20px'>
                 <h4 class='text-primary mx-auto d-block'>Login Form</h4>
                 <hr />
                 @if (Session::has('success'))
                     <div class="alert alert-success">{{ Session::get('success') }}</div>
                 @endif
                 @if (Session::has('error'))
                     <div class="alert alert-danger">{{ Session::get('error') }}</div>
                 @endif
                
                 <form action="{{ route('login-user') }}" method='post'>
                     @csrf

                     <div class="form-group">
                         <label for="email">E-Mail</label>
                         <input type="email" class="form-control" name='email' id='email'
                             placeholder='Enter Email' value='{{ old('email') }}'>
                             <span class="text-danger">
                                @error('email')
                                    {{ $message }}
                                @enderror
                            </span>
                     </div>
                     <div class="form-group">
                         <label for="password">Password</label>
                         <input type="password" class="form-control" name='password' id='password'
                             placeholder='Enter Password' value='{{ old('password') }}'>
                             <span class="text-danger">
                                @error('email')
                                    {{ $message }}
                                @enderror
                            </span>
                     </div>

                     <div class="form-group">
                         <button class="btn btn-primary btn-block m-2 d-block mx-auto" type='submit'>Login</button>
                     </div>
                     <a href='register'> New User ?? Register Here</a>

                 </form>
             </div>
         </div>
     </div>
 </body>

 </html>
