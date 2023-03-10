@layout('views/layouts/master')

@section('content')
    @if(inicompute($sliders))
        <div id="main-slider" class="slider-area">
            @foreach($sliders as $slider)
                <div class="single-slide">
                    <img src="{{ base_url('uploads/gallery/'.$slider->file_name) }}" alt="">
                    <div class="banner-overlay">
                        <div class="container">
                            <div class="caption style-2">
                                <h2>{{ sentenceMap(htmlspecialchars_decode($slider->file_title), 17, '<span>', '</span>') }}</h2>
                                <p>{{ htmlspecialchars_decode($slider->file_description) }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif

    @if(inicompute($featured_image))
        <div class="featured-slider">
            <img src="{{ base_url('uploads/gallery/'.$featured_image->file_name) }}" alt="{{ $featured_image->file_alt_text }}">
        </div>
    @endif

    <!-- bradcame area  -->
    <div class="bradcam-area area-padding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="section-title white-title bradcam-title text-uppercase text-center">
                        <h2> {{ $page->title }} </h2>
                        <span class="star"></span>
                        <span class="star"></span>
                        <span class="star"></span>
                    </div>
                </div>
                <div class="bradcam-wrap text-center">
                    <nav class="bradcam-inner">
                        <a class="bradcam-item text-uppercase" href="{{ site_url('frontend/'.$homepageType.'/'.$homepage->url) }}">{{ $homepageTitle }}</a>
                        <span class="brd-separetor">/</span>
                        <span class="bradcam-item active text-uppercase">{{ $page->title }}</span>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- bradcame area  -->

    <section id="our-teacher" class="our-teacher-area area-padding text-center gray-bg">
        <div class="container">
            <div class="row">
                @if(inicompute($doctors))
                    @foreach($doctors as $doctor)
                        <div class="col-md-3 col-sm-4">
                            <div class="teacher-list">
                                <div class="teacher__thumb">
                                    <img src="{{ imagelink($doctor->photo) }}" alt="">
                                    <div class="teacher__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-linkedin"></i></a>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                    </div>
                                </div>
                                <div class="teacher__body">
                                    <h2>{{ namesorting($doctor->name, 18) }} <span><?=(isset($designations[$doctor->designationID])) ? $designations[$doctor->designationID] : ''?></span></h2>
                                    @if(frontenddata::get_frontend('doctor_email_status'))
                                        @if($doctor->email)
                                            <a href="mailto:{{ $doctor->email }}">{{ $doctor->email }}</a>
                                        @endif
                                    @endif

                                    @if(frontendData::get_frontend('doctor_phone_status'))
                                        @if($doctor->phone)
                                            <p>{{ $doctor->phone }}</p>
                                        @endif
                                    @endif

                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </section>

    <!-- Start About Content -->
    <section id="about" class="">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="main-about">
                        <p> {{ htmlspecialchars_decode($page->content) }} </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close About Content -->

@endsection
