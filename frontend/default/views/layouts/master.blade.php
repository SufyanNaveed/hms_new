<!DOCTYPE html>
<html  class="no-js" lang="en-US">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="icon" href="{{ base_url('uploads/general/'.frontenddata::get_backend('logo')) }}" type="image/gif" sizes="16x16" >
    <title> {{ frontendData::get_backend('system_name') }}  </title>
    <script type="text/javascript"><?php jsStack(); ?></script>
    @include('views/partials/headerAssets')
</head>
<body>
    <header id="home">
        @include('views/partials/topbar')
        @include('views/partials/navbar')
    </header>

    @yield('content')
    @include('views/partials/footer')
    @include('views/partials/footerAssets')
</body>
</html>


