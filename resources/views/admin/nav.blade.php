<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">

            <!-- Collapsed Hamburger -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#app-navbar-collapse">
                <span class="sr-only">Увімкнути навігацію</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

            <div class="input-group col-md-2 pull-right">
                <div class="sidebar-heading"> <img src="/images/logo.jpg" alt="..." class="rounded float-left" style="max-width: 100%;">  </div>
            </div>

        <!-- Left Side Of Navbar -->
        {{-- <div class="row"> --}}
            <div class="input-group col-md-10 pull-right">
                <!-- Right Side Of Navbar -->
                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <ul class="nav navbar-right">
                        <!-- Authentication Links -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                {{ Auth::user()->name }}
                                {{-- <span class="caret"></span> --}}
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="{{ route('admin.logout') }}">
                                        Вихід
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        {{-- </div> --}}
    </div>
</nav>