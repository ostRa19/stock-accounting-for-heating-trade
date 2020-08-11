<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header col-sm-4 col-md-3 general-nav-col">

            <!-- Collapsed Hamburger -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#app-navbar-collapse">
                <span class="sr-only">Увімкнути навігацію</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <!-- Branding Image -->
            <a class="navbar-brand" href="{{ url('/shop') }}">
                <div class="sidebar-heading"> <img src="/images/logo.jpg" alt="..." class="rounded float-left" style="max-width: 70%;">  </div>
                {{-- {{ config('app.name', 'Laravel') }} --}}
            </a>
            {{-- <div class="input-group col-md-2 pull-right">
                <div class="sidebar-heading"> <img src="/images/logo.jpg" alt="..." class="rounded float-left" style="max-width: 100%;">  </div>
            </div> --}}

        </div>

        <nav-search :search-url="{{json_encode(route('search'))}}"></nav-search>

        <div class="collapse navbar-collapse" id="app-navbar-collapse">

                <div class="col-sm-4 col-lg-5 general-nav-col pull-right" style="padding: 6px 0">

                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right general-nav">
                        <!-- Authentication Links -->
                        @guest
                            <li><a href="{{ route('login') }}">Логін</a></li>
                            <li><a href="{{ route('register') }}">Реєстрація</a></li>
                            @else
                            <li><a href="/orders" target="_blank">Замовлення</a></li>
                                <nav-cart :cart="@if (session()->has('cartProducts')) {{json_encode(session('cartProducts'))}} @else {{json_encode([])}} @endif">
                                </nav-cart>

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-expanded="false">
                                        {{ Auth::user()->name }} <span class="caret"></span>
                                    </a>

                                    <ul class="dropdown-menu" role="menu">
                                        <li>
                                            <a onclick="document.getElementById('logout-form').submit();" style="cursor: pointer">
                                                Вихід
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                @endguest
                    </ul>

                </div>

                <form style="display: none" id="logout-form" action="{{ route('logout') }}" method="POST">
                    @csrf
                </form>
        </div>
    </div>
</nav>
<modal-wrapper></modal-wrapper>
