<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel</title>
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
        <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    </head>
    <body>
    <div id="app">

        <nav class="navbar navbar-expand-md navbar-light mb-4 shadow-sm">
            <div class="container-fluid pl-4 pr-4">
                <a class="navbar-brand" href="{{ url('/') }}">
                    <img class="img-fluid" height="100" width="100" src="{{ asset('./images/logo.png') }}" alt="Mozaik logo">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav  ml-auto">

                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/">{{ __('Kezdőlap') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="#">{{ __('Rólunk') }}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="#">{{ __('Kapcsolat') }}</a>
                        </li>

                        <!-- Authentication Links -->
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <settlementfinder></settlementfinder>



        </div>
        <v-footer></v-footer>
    </div>
    <script src="{{ asset('js/app.js') }}"></script>
    </body>

</html>
