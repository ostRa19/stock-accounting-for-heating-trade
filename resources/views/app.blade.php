<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    <style>
        .mb-0 {margin-bottom: 0 !important;}
        .bg-transparent {background-color: transparent !important;}
        .py-3 {padding-bottom:1rem!important;padding-top:1rem!important;}
    </style>
</head>
<body class="general-body">
<div id="app">
    @include('layouts.nav')
    @include('layouts.categories')
    @include('layouts.modal')

    <div class="container" style="padding-top: 15px">
        <div class="row">
            <div class="col-xs-4 col-sm-3 col-lg-2">
                @yield('left-column')
            </div>
            <div class="col-xs-8 col-sm-9 col-lg-10 content">
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
<script src="{{asset('js/my_script.js')}}"></script>

</body>
</html>