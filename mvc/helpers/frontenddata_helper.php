<?php Class frontenddata {
    
    static function get_frontend_delete() {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));
        $CI->cache->delete('get_frontend');
        return 'Get frontend cache remove';
    }

    static function get_backend_delete() {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));
        $CI->cache->delete('get_backend');
        return 'Get backend cache remove';
    }

    static function get_page_delete() {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));
        $CI->cache->delete('get_page');
        return 'Get page cache remove';
    }

    static function get_frontent_topbar_menu_delete() {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));
        $CI->cache->delete('get_topbar_menu');
        return 'Get topbar cache remove';
    }

    static function get_frontend($search = NULL) {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));
        if(empty($search)) {
            if(!$cacheData = $CI->cache->get('get_frontend')) {
                $CI->load->model('frontendsettings_m');
                $getItem = $CI->frontendsettings_m->get_frontendsettings();
                $CI->cache->save('get_frontend', $getItem, 900);
            }
            $cacheData = $CI->cache->get('get_frontend');
            return $cacheData;
        } else {
            $cacheData = $CI->cache->get('get_frontend');
            if(isset($cacheData->$search)) {
                return $cacheData->$search;
            } else {
                $CI->load->model('frontendsettings_m');
                $getItem = $CI->frontendsettings_m->get_frontendsettings();
                $CI->cache->save('get_frontend', $getItem, 900);
                $cacheData = $CI->cache->get('get_frontend');
                if(isset($cacheData->$search)) {
                    return $cacheData->$search;
                } else {
                    return '';
                }
            }
        }
    }

    static function get_backend($search = NULL) {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));

        if(empty($search)) {
            if(!$cacheData = $CI->cache->get('get_backend')) {
                $CI->load->model('generalsettings_m');
                $getItem = $CI->generalsettings_m->get_generalsettings();
                $CI->cache->save('get_backend', $getItem, 900);
            }
            $cacheData = $CI->cache->get('get_backend');
            return $cacheData;
        } else {
            $cacheData = $CI->cache->get('get_backend');
            if(isset($cacheData->$search)) {
                return $cacheData->$search;
            } else {
                $CI->load->model('generalsettings_m');
                $getItem = $CI->generalsettings_m->get_generalsettings();
                $CI->cache->save('get_backend', $getItem, 900);
                $cacheData = $CI->cache->get('get_backend');

                if(isset($cacheData->$search)) {
                    return $cacheData->$search;
                } else {
                    return '';
                }
            }
        }
    }

    static function get_page($search = NULL)
    {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));

        if(empty($search)) {
            if(!$cacheData = $CI->cache->get('get_page')) {
                $CI->load->model('pages_m');
                $getItem = $CI->pages_m->get_pages();
                $CI->cache->save('get_page', $getItem, 900);

            }
            $cacheData = $CI->cache->get('get_page');
            return $cacheData;
        } else {
            $CI->load->model('pages_m');

            $cacheData = $CI->cache->get('get_page');
            if(isset($cacheData[$search])) {
                return $cacheData[$search];
            } else {
                $CI->load->model('pages_m');
                $getItem = pluck($CI->pages_m->get_pages(), 'obj', 'pagesID');
                $CI->cache->save('get_page', $getItem, 900);

                $cacheData = $CI->cache->get('get_page');

                if(isset($cacheData[$search])) {
                    return $cacheData[$search];
                } else {
                    return '';
                }
            }
        }
    }

    static function get_frontent_topbar_menu()
    {
        $CI = & get_instance();
        $CI->load->driver('cache', array('adapter' => 'file'));
        $cacheData = $CI->cache->get('get_topbar_menu');
        if($cacheData != FALSE) {
            return $cacheData;
        } else {
            $CI->load->model('fmenu_relation_m');
            $CI->load->model('fmenu_m');
            $topbar = $CI->fmenu_m->get_single_fmenu(array('topbar' => 1));
            $getItem = $CI->fmenu_relation_m->get_join_with_page($topbar->fmenuID);

            $cat = '';
            if(inicompute($getItem)) {
                foreach ($getItem as $key => $pageValue) {
                    $cat .= "<li><a href='".site_url('frontend/page/'.$pageValue->url)."'>".$pageValue->menu_label."</a></li>";
                }
            }
            $cat .= "<li><a target='_blank' href='".site_url('signin/index')."'>".'Login'."</a></li>";

            $CI->cache->save('get_topbar_menu', $cat, 900);
            $cacheData = $CI->cache->get('get_topbar_menu');

            return $cacheData;
        }
    }

    static function frontendColorStyle($string)
    {
        $setStr = '';
        $bgColor = array('#86bc42','#222222','#D9504E','#1A4027','#6F008D','#E09622');
        if(!empty($string)) {
            $exps = explode(' ', $string);
            foreach ($exps as $expKey => $exp) {
                $setStr .= "<span style='color:".$bgColor[$expKey]."'> ". $exp ."</span>";
            }
        }
        return $setStr;
    }
}
?>