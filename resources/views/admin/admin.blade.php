<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Адміністратор</title>

    <!-- Styles -->

          <!-- Bootstrap core CSS -->
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Custom styles for this template -->
  <link href="/css/sidebar.css" rel="stylesheet">

      <link href="{{ asset('css/app.css') }}" rel="stylesheet">
  
</head>
<body style="padding-top: 100px;">
<div id="app">
    @if (Auth::guard('admin')->check())
        @include('admin.nav')
    @endif

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                @yield('left-column')
            </div>
            <div class="col-md-10 content">
                @include('layouts.error')
                @yield('content')
            </div>
        </div>
    </div>

    <hr class="mb-0">
    <footer class="footer bg-transparent py-3">
        <div class="container">
            <small class="text-muted">
                Складська система
            </small>
        </div>
    </footer>
</div>
<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>
<script src="{{ asset('js/admin_script.js') }}"></script>
    <!-- Bootstrap core JavaScript -->
    {{-- <script src="{{ asset('js/jquery.min.js')}}"></script>
    <script src="{{ asset('js/bootstrap.bundle.min.js')}}"></script>

    <!-- Menu Toggle Script -->
    <script>
      $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
      });
    </script> --}}


</body>
</html>