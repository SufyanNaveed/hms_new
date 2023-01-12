<article class="content">
    <div class="row">
        <div class="col-sm-4">
            <h3 class="title"><i class="fa fa-connectdevelop"></i> <?=$this->lang->line('panel_title')?> </h3>
        </div>
        <div class="col-sm-8 pull-right">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb pull-right themebreadcrumb">
                    <li class="breadcrumb-item"><a href="<?=site_url('dashboard/index')?>"><i class="fa fa-laptop"></i> <?=$this->lang->line('menu_dashboard')?></a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="<?=site_url('page/index')?>"><?=$this->lang->line('menu_page')?></a></li>
                    <li class="breadcrumb-item active" aria-current="page"><?=$this->lang->line('page_edit')?></li>
                </ol>
            </nav>
        </div>
    </div>
    <section class="section">
        <div class="row">
            <div class="col-sm-12">
                <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link" id="list_tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="true"><i class="fa fa-table"></i> <?=$this->lang->line('page_list')?></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" id="add_tab" data-toggle="tab" href="#edit" role="tab" aria-controls="edit" aria-selected="false"><i class="fa fa-edit"></i> <?=$this->lang->line('page_edit')?></a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list_tab">
                        <?php $this->load->view('page/table');?>
                    </div>
                    <div class="tab-pane fade show active" id="edit" role="tabpanel" aria-labelledby="add_tab">
                        <form method="POST">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name()?>" value="<?=$this->security->get_csrf_hash()?>" />
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="add--page--wrap">
                                        <h3><?=$this->lang->line('page_edit_page')?></h3>

                                        <div class="form-group <?=form_error('title') ? 'has-error' : '' ?>">
                                            <input type="text" id="title" value="<?=set_value('title', $page->title)?>" name="title" class="form-control" placeholder="<?=$this->lang->line('page_enter_title_here')?>">
                                            <span class="errors"><?php echo form_error('title'); ?></span>
                                            
                                            <div class="permalink-area" <?=($send_url['status']) ? 'style="display:block"' : 'style="display:none"' ?>>
                                                <span class="permalink-text"><?=$this->lang->line('page_permalink')?>:</span>
                                                <span class="permalink"><?=site_url('frontend/page/')?><span class="editable-permalink-name"><?=($send_url['status']) ? $send_url['url'] : '' ?></span><input id="url" name="url" class="url" type="text" value="<?=($send_url['status']) ? $send_url['url'] : '' ?>" style="display: none" ></span>
                                                <span><input id="permalink-edit" type="button" value="<?=$this->lang->line('page_sm_edit')?>"></span>
                                                <span id="editable-permalink-section" style="display: none">
                                                    <span id="save-permalink">
                                                        <input type="button" value="<?=$this->lang->line('page_ok')?>">
                                                    </span>
                                                    <span class="cancel-permalink" id="cancel-permalink"><?=$this->lang->line('page_cancel')?></span>
                                                </span>
                                            </div>
                                            <span class="form-group has-error ">
                                                <span class="errors">
                                                    <?php echo form_error('url'); ?>
                                                </span>
                                            </span>
                                        </div>
                                        <div class="form-group has-error">
                                            <span class="add--media" data-toggle="modal" data-target="#mediaLibrary"><i class="fa fa-camera"></i><?=$this->lang->line('page_add_media')?></span>
                                            <textarea id="write-content" name="content"><?=set_value('content', $page->content)?></textarea>
                                            <span class="errors"><?php echo form_error('content'); ?></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <aside class="page--right--sidebar">
                                        <div class="bg-white mb-15">
                                            <div class="sidebar--header">
                                                <h4><?=$this->lang->line('page_publish')?></h4>
                                                <span id="publish" class="flipup">
                                                    <i class="fa fa-caret-up"></i>
                                                </span>
                                            </div>
                                            <div class="sidebar-body" id="publish-box">
                                                <div class="save-preview-btn clearfix">
                                                    <button type="submit" id="preview" class="save-preview-btn pull-right clearfix" value="preview" name="submit"><?=$this->lang->line('page_preview_changes')?></button>

                                                </div>
                                                <div class="post-status">
                                                    <i class="fa fa-map-pin"></i>
                                                    <?=$this->lang->line('page_status')?>:
                                                    <span id="status-message" class="bold">
                                                        <?php
                                                            if($send_status == 'draft')
                                                                echo $this->lang->line('page_draft');
                                                            elseif($send_status == 'review')
                                                                echo $this->lang->line('page_pending_review');
                                                            elseif($send_status == 'published')
                                                                echo $this->lang->line('page_published');
                                                        ?>
                                                        
                                                    </span>
                                                    <a href="#" class="post-edit" id="draft-edit"><?=$this->lang->line('page_edit')?></a>
                                                    <div class="post-status-select" id="draft-edit-show">
                                                        <?php 
                                                            $statusArray = array(
                                                                'published' => $this->lang->line('page_published'),
                                                                'review' => $this->lang->line('page_pending_review'),
                                                                'draft' => $this->lang->line('page_draft')
                                                            );
                                                            echo form_dropdown("status", $statusArray, set_value("status", pageStatus($page->status, FALSE)), "id='status'"); 
                                                        ?>
                                                        <a href="#" id="save-status" class="save-post-status"><?=$this->lang->line('page_ok')?></a>
                                                        <a href="#" id="cancle-draft" class="cancel-post-status"><?=$this->lang->line('page_cancel')?></a>
                                                    </div>
                                                </div>
                                                <div class="post-status">
                                                    <i class="fa fa-eye"></i>
                                                    <?=$this->lang->line('page_visibility')?>:
                                                    <span id="visibility-message" class="bold">
                                                        <?php 
                                                            pageVisibility($send_visibility, FALSE);
                                                        ?>
                                                    </span>
                                                    <a href="#" class="post-edit" id="visibility-edit"><?=$this->lang->line('page_edit')?></a>
                                                    <div class="post-status-select" id="visibility-edit-show">
                                                        <span id="visibility-all-data-set">
                                                            <div class="form-group ini-dis-flex">
                                                                <input class="visibility" type="radio" id="public" name="visibility" value="1" checked <?=set_radio("visibility", 1, pageVisibility(1, true, $send_visibility))?>>
                                                                <label for="public"><?=$this->lang->line('page_public')?></label>
                                                            </div>
                                                            <div class="form-group ini-dis-flex">
                                                                <input class="visibility" type="radio" name="visibility" id="protected" value="2" <?=set_radio("visibility", 2, pageVisibility(2, true, $send_visibility))?>>
                                                                <label for="protected"><?=$this->lang->line('page_password_protected')?></label>
                                                            </div>
                                                            <div class="form-group <?=form_error('protected_password') ? 'has-error' : '' ?>" <?=($send_visibility == 2) ? '' : 'style="display: none"'?> >
                                                                <label for="protected_password"><?=$this->lang->line('page_password')?>:</label>
                                                                <br>
                                                                <input type="text" name="protected_password" id="protected_password" class="form-control password-text-field" value="<?=set_value('protected_password')?>">
                                                            </div>
                                                            <div class="form-group ini-dis-flex">
                                                                <input class="visibility" type="radio" name="visibility" value="3" id="private" <?=set_radio("visibility", 3, pageVisibility(3, true, $send_visibility))?>>
                                                                <label for="private"><?=$this->lang->line('page_private')?></label>
                                                            </div>
                                                        </span>
                                                        <a href="#" id="save-visibility" class="save-post-status"><?=$this->lang->line('page_ok')?></a>
                                                        <a href="#" id="cancel-visibility" class="cancel-post-status"><?=$this->lang->line('page_cancel')?></a>
                                                    </div>
                                                </div>
                                                <div class="post-status">
                                                    <i class="fa fa-calendar-o"></i>
                                                    <?=$this->lang->line('page_publish')?>:
                                                    <span id="publish_message" class="bold">
                                                        <?php
                                                            if($send_publish) {
                                                                if($send_date_status == 'same')
                                                                    echo $this->lang->line('page_immediately');
                                                                else 
                                                                    echo $send_date_status;
                                                            }
                                                        ?>
                                                    </span>
                                                    <a href="#" class="post-edit" id="publish-edit"><?=$this->lang->line('page_edit')?></a>
                                                    <div class="post-status-select" id="publish-edit-show">
                                                        <?php
                                                            $monthArray = array(
                                                                '01' => '01-Jan',
                                                                '02' => '02-Feb',
                                                                '03' => '03-Mar',
                                                                '04' => '04-Apr',
                                                                '05' => '05-May',
                                                                '06' => '06-Jun',
                                                                '07' => '07-Jul',
                                                                '08' => '08-Aug',
                                                                '09' => '09-Sep',
                                                                '10' => '10-Oct',
                                                                '11' => '11-Nov',
                                                                '12' => '12-Dec',
                                                            );
                                                            $addClass = '';
                                                            if(form_error('publish_month') || form_error('publish_day') || form_error('publish_year')) {
                                                                $addClass = 'date-error-color';
                                                            }
                                                            echo form_dropdown("publish_month", $monthArray, set_value("publish_month", date("m", strtotime($page->publish_date))), "id='publish_month' class='".$addClass."'"); 
                                                        ?>
                                                        <label class="sr-only">Day</label>
                                                        <input id="publish_day" name="publish_day" type="text" value="<?=set_value('publish_day', date("d", strtotime($page->publish_date)))?>" size="2" class="<?=$addClass?>" maxlength="2">
                                                        <label class="sr-only">year</label>
                                                        <input id="publish_year" name="publish_year" type="text" value="<?=set_value('publish_year', date("Y", strtotime($page->publish_date)))?>" size="4" class="<?=$addClass?>" maxlength="4">
                                                        <span>@</span>
                                                        <input id="publish_hour" name="publish_hour" type="text" value="<?=set_value('publish_hour', date("H", strtotime($page->publish_date)))?>" size="2" class="<?=$addClass?>" maxlength="2">
                                                        <span>:</span>
                                                        <input id="publish_minute" name="publish_minute" type="text" value="<?=set_value('publish_minute', date("i", strtotime($page->publish_date)))?>" size="2" class="<?=$addClass?>" maxlength="2">
                                                        
                                                        <a href="#" id="save-publish" class="save-post-status"><?=$this->lang->line('page_ok')?></a>
                                                        <a href="#" id="cancel-publish" class="cancel-post-status"><?=$this->lang->line('page_cancel')?></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="publish-box-footer" class="publish-btn text-right">
                                                <input type="submit" name="submit" value="<?=$this->lang->line('page_update')?>">
                                            </div>
                                        </div>

                                        <div class="bg-white mb-15">
                                            <div class="sidebar--header">
                                                <h4><?=$this->lang->line('page_page_attribute')?></h4>
                                                <span id="attribute" class="flipup">
                                                    <i class="fa fa-caret-up"></i>
                                                </span>
                                            </div>
                                            <div class="sidebar-body" id="attribute-box">
                                                <div class="pae-attribute">
                                                    <div class="form-group">
                                                        <label for="select-parent"><?=$this->lang->line('page_template')?></label>
                                                        <?php
                                                            $template_array = array('none' => 'None');
                                                            if(inicompute($frontend_templates)) {
                                                                foreach ($frontend_templates as $frontend_template) {
                                                                    $template_array[$frontend_template->template_name] = ucfirst($frontend_template->template_name);
                                                                }
                                                            }
                                                            echo form_dropdown("template", $template_array, set_value("template", $page->template), "id='template'");
                                                        ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="bg-white mb-15">
                                            <div class="sidebar--header">
                                                <h4><?=$this->lang->line('page_featured_image')?></h4>
                                                <span id="featuredimage" class="flipup">
                                                    <i class="fa fa-caret-up"></i>
                                                </span>
                                            </div>
                                            <div class="sidebar-body" id="featuredimage-box">
                                                <div class="feauret-img-show" <?=inicompute($send_featured_image) ? 'data-toggle="modal" data-target="#SetFeaturedImage"' : '' ?> >
                                                    <?php
                                                        if(inicompute($send_featured_image)) {
                                                            echo '<img src="'.base_url('uploads/gallery/'.$send_featured_image->file_name).'" widht="100%">';
                                                        }
                                                    ?>
                                                </div>
                                                <input type="text" id="featured_image" name="featured_image" class="hide" value="<?=set_value('featured_image', $page->featured_image)?>">
                                                <span class="featured-image-btn <?=inicompute($send_featured_image) ? 'hide' : ''?>" data-toggle="modal" data-target="#SetFeaturedImage" id="set-featured-img"><?=$this->lang->line('page_set_featured_image')?></span>
                                                <span class="featured-image-btn <?=!inicompute($send_featured_image) ? 'hide' : ''?>" onclick="removeFeatureImage(this, 'featured_image', 'feauret-img-show')"  id="remove-set-featured-img"><?=$this->lang->line('page_remove_featured_image')?></span>
                                            </div>
                                        </div>

                                        <div class="bg-white mb-15">
                                            <div class="sidebar--header">
                                                <h4><?=$this->lang->line('page_slider_images')?></h4>
                                                <span id="sliderimages" class="flipup">
                                                    <i class="fa fa-caret-up"></i>
                                                </span>
                                            </div>
                                            <input type="text" id="hidden_slider_images" name="hidden_slider_images" class="hide" value="<?=set_value('hidden_slider_images', $send_hidden_slider_images)?>">
                                            <div class="sidebar-body sliderImages-box" id="sliderimages-box">
                                                <div class="clearfix">
                                                    <div class="slider-pluck">
                                                        <?php if(inicompute($send_slider_images)) { foreach ($send_slider_images as $send_slider_image_key => $send_slider_image) {  ?>
                                                            <div class="s-sliderImage selected">
                                                                <img data-toggle="tooltip" src="<?=base_url('uploads/gallery/'.$send_slider_image)?>" >
                                                                <button class="check slider-delete" type="button" id="<?=$send_slider_image_key?>">
                                                                    <span class="media-modal-icon"></span>
                                                                    <span class="sr-only">Deselect</span>
                                                                </button>
                                                            </div>
                                                        <?php } } ?>
                                                    </div>
                                                </div>

                                                <span class="slider-images-btn featured-image-btn" data-toggle="modal" data-target="#SetSliderImages"><?=$this->lang->line('page_set_slider_image')?></span>
                                            </div>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</article>


<div class="modal fade mediaLibrary" id="mediaLibrary">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="modal-body">
            <div class="nav-tabs-custom media-sidebar clearfix">
                <ul class="nav flex-column nav-pills pull-left media-sidebar-nav-tabs" role="tablist">
                    <li><a class="nav-link active" role="tab" data-toggle="tab" href="#insertMedia"><?=$this->lang->line('page_insert_media')?></a></li>
                    <li><a class="nav-link" role="tab" data-toggle="tab" href="#createGallery"><?=$this->lang->line('page_create_gallery')?></a></li>
                    <li><a class="nav-link" role="tab" data-toggle="tab" href="#createAudioPlaylist"><?=$this->lang->line('page_create_audio_playlist')?></a></li>
                    <li><a class="nav-link" role="tab" data-toggle="tab" href="#createVideoPlaylist"><?=$this->lang->line('page_create_video_playlist')?></a></li>
                    <li><a class="nav-link" role="tab" data-toggle="tab" href="#featuredImage"><?=$this->lang->line('page_featured_image')?></a></li>
                </ul>

                <div class="tab-content media-sidebar-content pull-left">
                    <!-- Start Insert Media -->
                    <div id="insertMedia" class="tab-pane tab-border-none active">
                        <h2><?=$this->lang->line('page_insert_media')?></h2>
                        <div class="nav_custom_tabs">
                            <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#insertMediaUpload"><?=$this->lang->line('page_upload_files')?></a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#insertMediaUploadLibrary"><?=$this->lang->line('page_media_library')?></a></li>
                            </ul>

                            <div class="tab-content no-padd">
                                <div id="insertMediaUpload" class="tab-pane active">
                                    <div class="drop--files">
                                        <form id="insert-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                            <input type="text" name="media_gallery_type" value="1" style="display: none">
                                            <input type="text" name="focus_id" value="insertMedia" style="display: none">
                                            <div class="fileupload-input-group">
                                                <span class="fileupload-input-group-btn">
                                                    <div class="fileupload-image-preview-input">
                                                        <?=$this->lang->line('page_select_file')?>
                                                        <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif, .mp3,audio/*, video/mp4,video/x-m4v,video/*" name="file"/>
                                                    </div>
                                                </span>
                                            </div>
                                        </form>
                                        <div class="post--upload--info">
                                            <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                        </div>
                                    </div>
                                </div>

                                <div id="insertMediaUploadLibrary" class="tab-pane clearfix">
                                    <div class="media-library-left pos-rel pull-left">
                                        <?php 
                                   
                                            if(inicompute($media_gallerys_all)) {
                                                echo '<div class="attached-preview">';
                                                    echo '<ul class="insert_media_type">';
                                                foreach ($media_gallerys_all as $media_gallerys_all_key => $media_gallerys_val) {
                                                    if($media_gallerys_val->media_gallery_type == 1) {
                                        ?>       
                                                        <li class="insert_media_image" onclick="getFileInfo(this, 'insert_media_type', 'image',  'single', 'insert_media_hidden_field', true, 'insert_media');" id ="<?=$media_gallerys_val->media_galleryID?>">
                                                            <div class="thumb">
                                                                <img src="<?=base_url('uploads/gallery/'.$media_gallerys_val->file_name)?>" alt="<?=$media_gallerys_val->file_alt_text?>">
                                                            </div>
                                                        </li>
                                        <?php
                                                    } elseif($media_gallerys_val->media_gallery_type == 2) {
                                        ?>
                                                        <li class="insert_media_audio" onclick="getFileInfo(this, 'insert_media_type', 'audio', 'single', 'insert_media_hidden_field', true, 'insert_media');" id ="<?=$media_gallerys_val->media_galleryID?>">
                                                            <div class="thumb">
                                                                <i class="fa fa-file-audio-o"></i>
                                                            </div>
                                                            <div class="video-title">
                                                                <p><?=namesorting($media_gallerys_val->file_original_name, 50)?></p>
                                                            </div>
                                                        </li>

                                        <?php
                                                    } elseif($media_gallerys_val->media_gallery_type == 3) {
                                        ?>
                                                        <li class="insert_media_video" onclick="getFileInfo(this, 'insert_media_type', 'video', 'single', 'insert_media_hidden_field', true, 'insert_media');" id ="<?=$media_gallerys_val->media_galleryID?>">
                                                            <div class="thumb">
                                                                <i class="fa fa-file-video-o"></i>
                                                            </div>
                                                            <div class="video-title">
                                                                <p><?=namesorting($media_gallerys_val->file_original_name, 50)?></p>
                                                            </div>
                                                        </li>


                                        <?php
                                                    
                                                    } 
                                                }
                                                    echo '</ul>';  
                                                echo '</div>';
                                                echo '<input type="text" id="insert_media_hidden_field" style="display:none">';

                                            } else { 
                                        ?>
                                            <div class="drop--files">
                                                <form id="insert-fileupload-list" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                                    <input type="text" name="media_gallery_type" value="1" style="display: none">
                                                    <input type="text" name="focus_id" value="insertMedia" style="display: none">
                                                    <div class="fileupload-input-group">
                                                        <span class="fileupload-input-group-btn">
                                                            <div class="fileupload-image-preview-input">
                                                                <?=$this->lang->line('page_select_file')?>
                                                                <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif, .mp3,audio/*, video/mp4,video/x-m4v,video/*" name="file"/>
                                                            </div>
                                                        </span>
                                                    </div>
                                                </form>
                                                <div class="post--upload--info">
                                                    <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="media-library-right pull-left">
                                        <div class="attached-details" id="insert_media_type">
                                            

                                        </div>
                                    </div>
                                </div>

                                <div class="footer--upload">
                                    <a data-dismiss="modal" id="insert_into_page" onclick="setFileToEditor(this, 'insert_media_hidden_field', 'insert_media_type');"  href="#"><?=$this->lang->line('page_insert_into_page')?></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Close Insert Media -->

                    <!-- Start Create Gallery -->
                    <div id="createGallery" class="tab-pane tab-border-none">
                        <h2><?=$this->lang->line('page_create_gallery')?></h2>
                        <div class="nav_custom_tabs">
                            <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#createGalleryMediaUpload"><?=$this->lang->line('page_upload_files')?></a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#createGalleryMediaUploadLibrary"><?=$this->lang->line('page_media_library')?></a></li>
                            </ul>

                            <div class="tab-content no-padd">
                                <div id="createGalleryMediaUpload" class="tab-pane active">
                                    <div class="drop--files">
                                        <form id="create_gallery-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                            <input type="text" name="media_gallery_type" value="2" style="display: none">
                                            <input type="text" name="focus_id" value="createGallery" style="display: none">
                                            <div class="fileupload-input-group">
                                                <span class="fileupload-input-group-btn">
                                                    <div class="fileupload-image-preview-input">
                                                        <?=$this->lang->line('page_select_file')?>
                                                        <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                    </div>
                                                </span>
                                            </div>
                                        </form>
                                        <div class="post--upload--info">
                                            <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                        </div>
                                    </div>
                                </div>

                                <div id="createGalleryMediaUploadLibrary" class="tab-pane clearfix">
                                    <div class="media-library-left pos-rel pull-left">
                                        <?php 
                                            if(inicompute($media_gallerys_images)) {
                                                echo '<div class="attached-preview">';
                                                    echo '<ul class="create_gallery_type">';
                                                foreach ($media_gallerys_images as $media_gallerys_image_key => $media_gallerys_image) {
                                        ?>       
                                                    <li class="create_gallery_image" onclick="getFileInfo(this, 'create_gallery_type', 'image',  'multi', 'create_gallery_hidden_field', false, 'create_gallery');" id ="<?=$media_gallerys_image->media_galleryID?>">
                                                        <div class="thumb">
                                                            <img src="<?=base_url('uploads/gallery/'.$media_gallerys_image->file_name)?>" alt="<?=$media_gallerys_image->file_alt_text?>">
                                                        </div>
                                                    </li>
                                        <?php 
                                                }
                                                    echo '</ul>';  
                                                echo '</div>';
                                                echo '<input type="text" id="create_gallery_hidden_field" style="display:none">';

                                            } else { ?>
                                            <div class="drop--files">
                                                <form id="create_gallery-fileupload-list" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                                    <input type="text" name="media_gallery_type" value="2" style="display: none">
                                                    <input type="text" name="focus_id" value="createGallery" style="display: none">
                                                    <div class="fileupload-input-group">
                                                        <span class="fileupload-input-group-btn">
                                                            <div class="fileupload-image-preview-input">
                                                                <?=$this->lang->line('page_select_file')?>
                                                                <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                            </div>
                                                        </span>
                                                    </div>
                                                </form>
                                                <div class="post--upload--info">
                                                    <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="media-library-right pull-left">
                                        <div class="attached-details" id="create_gallery_type">

                                        </div>
                                    </div>
                                </div>

                                <div class="footer--upload">
                                    <a data-dismiss="modal" id="create_a_new_gallery" onclick="setFileToEditor(this, 'create_gallery_hidden_field', 'create_gallery_type');"  href="#"><?=$this->lang->line('page_create_a_new_gallery')?></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Close Create Gallery -->

                    <!-- Start Create Audio Playlist -->
                    <div id="createAudioPlaylist" class="tab-pane tab-border-none">
                        <h2><?=$this->lang->line('page_create_audio_playlist')?></h2>
                        <div class="nav_custom_tabs">
                            <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#createAudioPlaylistMediaUpload"><?=$this->lang->line('page_upload_files')?></a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#createAudioPlaylistMediaUploadLibrary"><?=$this->lang->line('page_media_library')?></a></li>
                            </ul>

                            <div class="tab-content no-padd">
                                <div id="createAudioPlaylistMediaUpload" class="tab-pane active">
                                    <div class="drop--files">
                                        <form id="create_audio_playlist-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                            <input type="text" name="media_gallery_type" value="3" style="display: none">
                                            <input type="text" name="focus_id" value="createAudioPlaylist" style="display: none">
                                            <div class="fileupload-input-group">
                                                <span class="fileupload-input-group-btn">
                                                    <div class="fileupload-image-preview-input">
                                                        <?=$this->lang->line('page_select_file')?>
                                                        <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept=".mp3,audio/*" name="file"/>
                                                    </div>
                                                </span>
                                            </div>
                                        </form>
                                        <div class="post--upload--info">
                                            <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                        </div>
                                    </div>
                                </div>

                                <div id="createAudioPlaylistMediaUploadLibrary" class="tab-pane clearfix">
                                    <div class="media-library-left pos-rel pull-left">
                                        <?php 
                                            if(inicompute($media_gallerys_audios)) {
                                                echo '<div class="attached-preview">';
                                                    echo '<ul class="create_video_playlist_type">';
                                                foreach ($media_gallerys_audios as $media_gallerys_audio_key => $media_gallerys_audio) {
                                        ?>       
                                                    <li class="create_audio_playlist_audio" onclick="getFileInfo(this, 'create_audio_playlist_type', 'audio', 'multi', 'create_audio_playlist_hidden_field', false, 'create_audio_playlist');" id ="<?=$media_gallerys_audio->media_galleryID?>">
                                                        <div class="thumb">
                                                            <i class="fa fa-file-audio-o"></i>
                                                        </div>
                                                        <div class="video-title">
                                                            <p><?=namesorting($media_gallerys_audio->file_original_name, 50)?></p>
                                                        </div>
                                                    </li>
                                        <?php 
                                                }
                                                    echo '</ul>';  
                                                echo '</div>';
                                                echo '<input type="text" id="create_audio_playlist_hidden_field" style="display:none">';

                                            } else { ?>
                                            <div class="drop--files">
                                                <form id="create_audio_playlist-fileupload-list" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                                    <input type="text" name="media_gallery_type" value="3" style="display: none">
                                                    <input type="text" name="focus_id" value="createAudioPlaylist" style="display: none">
                                                    <div class="fileupload-input-group">
                                                        <span class="fileupload-input-group-btn">
                                                            <div class="fileupload-image-preview-input">
                                                                <?=$this->lang->line('page_select_file')?>
                                                                <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept=".mp3,audio/*" name="file"/>
                                                            </div>
                                                        </span>
                                                    </div>
                                                </form>
                                                <div class="post--upload--info">
                                                    <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="media-library-right pull-left">
                                        <div class="attached-details" id="create_audio_playlist_type">

                                        </div>
                                    </div>
                                </div>

                                <div class="footer--upload">
                                    <a data-dismiss="modal" id="create_a_new_playlist" onclick="setFileToEditor(this, 'create_audio_playlist_hidden_field', 'create_video_playlist_type');" href="#"><?=$this->lang->line('page_create_a_new_playlist')?></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Close Create Audio Playlist -->

                    <!-- Start Create Video Playlist -->
                    <div id="createVideoPlaylist" class="tab-pane tab-border-none">
                        <h2><?=$this->lang->line('page_create_video_playlist')?></h2>
                        <div class="nav_custom_tabs">
                            <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#createVideoPlaylistMediaUpload"><?=$this->lang->line('page_upload_files')?></a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#createVideoPlaylistMediaUploadLibrary"><?=$this->lang->line('page_media_library')?></a></li>
                            </ul>

                            <div class="tab-content no-padd">
                                <div id="createVideoPlaylistMediaUpload" class="tab-pane active">
                                    <div class="drop--files">
                                        <form id="create_video_playlist-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                            <input type="text" name="media_gallery_type" value="4" style="display: none">
                                            <input type="text" name="focus_id" value="createVideoPlaylist" style="display: none">
                                            <div class="fileupload-input-group">
                                                <span class="fileupload-input-group-btn">
                                                    <div class="fileupload-image-preview-input">
                                                        <?=$this->lang->line('page_select_file')?>
                                                        <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="video/mp4,video/x-m4v,video/*" name="file"/>
                                                    </div>
                                                </span>
                                            </div>
                                        </form>
                                        <div class="post--upload--info">
                                            <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                        </div>
                                    </div>
                                </div>

                                <div id="createVideoPlaylistMediaUploadLibrary" class="tab-pane clearfix">
                                    <div class="media-library-left pos-rel pull-left">
                                        <?php 
                                            if(inicompute($media_gallerys_videos)) {
                                                echo '<div class="attached-preview">';
                                                    echo '<ul class="create_video_playlist_type">';
                                                foreach ($media_gallerys_videos as $media_gallerys_video_key => $media_gallerys_video) {
                                        ?>       
                                                    <li class="create_video_playlist_video" onclick="getFileInfo(this, 'create_video_playlist_type', 'video', 'multi', 'create_video_playlist_hidden_field', false, 'create_video_playlist');" id ="<?=$media_gallerys_video->media_galleryID?>">
                                                        <div class="thumb">
                                                            <i class="fa fa-file-video-o"></i>
                                                        </div>
                                                        <div class="video-title">
                                                            <p><?=namesorting($media_gallerys_video->file_original_name, 50)?></p>
                                                        </div>
                                                    </li>
                                        <?php 
                                                }
                                                    echo '</ul>';  
                                                echo '</div>';
                                                echo '<input type="text" id="create_video_playlist_hidden_field" style="display:none">';

                                            } else { ?>
                                            <div class="drop--files">
                                                <form id="create_video_playlist-fileupload-list" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                                    <input type="text" name="media_gallery_type" value="4" style="display: none">
                                                    <input type="text" name="focus_id" value="createVideoPlaylist" style="display: none">
                                                    <div class="fileupload-input-group">
                                                        <span class="fileupload-input-group-btn">
                                                            <div class="fileupload-image-preview-input">
                                                                <?=$this->lang->line('page_select_file')?>
                                                                <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="video/mp4,video/x-m4v,video/*" name="file"/>
                                                            </div>
                                                        </span>
                                                    </div>
                                                </form>
                                                <div class="post--upload--info">
                                                    <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="media-library-right pull-left">
                                        <div class="attached-details" id="create_video_playlist_type">

                                        </div>
                                    </div>
                                </div>

                                <div class="footer--upload">
                                    <a data-dismiss="modal" id="create_a_new_video_playlist" onclick="setFileToEditor(this, 'create_video_playlist_hidden_field', 'create_video_playlist_type');" href="#"><?=$this->lang->line('page_create_a_new_video_playlist')?></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Close Create Video Playlist -->

                    <!-- Start Create Featured Image -->
                    <div id="featuredImage" class="tab-pane tab-border-none">
                        <h2><?=$this->lang->line('page_featured_image')?></h2>
                        <div class="nav_custom_tabs">
                            <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#featuredImageMediaUpload"><?=$this->lang->line('page_upload_files')?></a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#featuredImageMediaUploadLibrary"><?=$this->lang->line('page_media_library')?></a></li>
                            </ul>

                            <div class="tab-content no-padd">
                                <div id="featuredImageMediaUpload" class="tab-pane active">
                                    <div class="drop--files">
                                        <form id="featured_image-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                            <input type="text" name="media_gallery_type" value="2" style="display: none">
                                            <input type="text" name="focus_id" value="featuredImage" style="display: none">
                                            <div class="fileupload-input-group">
                                                <span class="fileupload-input-group-btn">
                                                    <div class="fileupload-image-preview-input">
                                                        <?=$this->lang->line('page_select_file')?>
                                                        <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                    </div>
                                                </span>
                                            </div>
                                        </form>
                                        <div class="post--upload--info">
                                            <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                        </div>
                                    </div>
                                </div>

                                <div id="featuredImageMediaUploadLibrary" class="tab-pane clearfix">
                                    <div class="media-library-left pos-rel pull-left">
                                        <?php 
                                            if(inicompute($media_gallerys_images)) {
                                                echo '<div class="attached-preview">';
                                                    echo '<ul class="featured_image_type">';
                                                foreach ($media_gallerys_images as $media_gallerys_image_key => $media_gallerys_image) {
                                        ?>       
                                                    <li class="featured_image_image_info" onclick="getFileInfo(this, 'featured_image_type', 'image',  'single', 'featured_image_hidden_field', false, 'featured_image');" id ="<?=$media_gallerys_image->media_galleryID?>">
                                                        <div class="thumb">
                                                            <img src="<?=base_url('uploads/gallery/'.$media_gallerys_image->file_name)?>" alt="<?=$media_gallerys_image->file_alt_text?>">
                                                        </div>
                                                    </li>
                                        <?php 
                                                }
                                                    echo '</ul>';  
                                                echo '</div>';
                                                echo '<input type="text" id="featured_image_hidden_field" style="display:none">';

                                            } else { ?>
                                            <div class="drop--files">
                                                <form id="featured_image-fileupload-list" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                                    <input type="text" name="media_gallery_type" value="2" style="display: none">
                                                    <input type="text" name="focus_id" value="featuredImage" style="display: none">
                                                    <div class="fileupload-input-group">
                                                        <span class="fileupload-input-group-btn">
                                                            <div class="fileupload-image-preview-input">
                                                                <?=$this->lang->line('page_select_file')?>
                                                                <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                            </div>
                                                        </span>
                                                    </div>
                                                </form>
                                                <div class="post--upload--info">
                                                    <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                    <div class="media-library-right pull-left">
                                        <div class="attached-details" id="featured_image_type">
                                            

                                        </div>
                                    </div>
                                </div>

                                <div class="footer--upload">
                                    <a data-dismiss="modal" id="set_featured_image" onclick="setFileToEditor(this, 'featured_image_hidden_field', 'featured_image_type');" href="#"><?=$this->lang->line('page_set_featured_image')?></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Close Create Featured Image -->
                </div>
            </div>
        </div>
    </div>
  </div>
</div>

<div class="modal fade mediaLibrary new-pattern" id="SetFeaturedImage">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-body">
                <div id="setfeaturedImage" class="tab-pane tab-border-none">
                    <h2><?=$this->lang->line('page_featured_image')?></h2>
                    <div class="nav_custom_tabs">
                        <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#setfeaturedImageMediaUpload"><?=$this->lang->line('page_upload_files')?></a></li>
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#setfeaturedImageMediaUploadLibrary"><?=$this->lang->line('page_media_library')?></a></li>
                        </ul>

                        <div class="tab-content no-padd">
                            <div id="setfeaturedImageMediaUpload" class="tab-pane active">
                                <div class="drop--files">
                                    <form id="set_featured_image-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                        <input type="text" name="media_gallery_type" value="2" style="display: none">
                                        <input type="text" name="focus_id" value="setfeaturedImage" style="display: none">
                                        <div class="fileupload-input-group">
                                            <span class="fileupload-input-group-btn">
                                                <div class="fileupload-image-preview-input">
                                                    <?=$this->lang->line('page_select_file')?>
                                                    <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                </div>
                                            </span>
                                        </div>
                                    </form>
                                    <div class="post--upload--info">
                                        <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                    </div>
                                </div>
                            </div>

                            <div id="setfeaturedImageMediaUploadLibrary" class="tab-pane clearfix">
                                <div class="media-library-left pos-rel pull-left">
                                    <?php 
                                        if(inicompute($media_gallerys_images)) {
                                            echo '<div class="attached-preview">';
                                                echo '<ul class="set_featured_image_type">';
                                            foreach ($media_gallerys_images as $media_gallerys_image_key => $media_gallerys_image) {
                                    ?>       
                                                <li class="set_featured_image_image_info" onclick="getFileInfo(this, 'set_featured_image_type', 'image',  'single', 'set_featured_image_hidden_field', false, 'set_featured_image');" id ="<?=$media_gallerys_image->media_galleryID?>">
                                                    <div class="thumb">
                                                        <img src="<?=base_url('uploads/gallery/'.$media_gallerys_image->file_name)?>" alt="<?=$media_gallerys_image->file_alt_text?>">
                                                    </div>
                                                </li>
                                    <?php 
                                            }
                                                echo '</ul>';  
                                            echo '</div>';
                                            echo '<input type="text" id="set_featured_image_hidden_field" style="display:none">';

                                        } else { ?>
                                        <div class="drop--files">
                                            <form id="set_featured_image-fileupload-list" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                                <input type="text" name="media_gallery_type" value="2" style="display: none">
                                                <input type="text" name="focus_id" value="setfeaturedImage" style="display: none">
                                                <div class="fileupload-input-group">
                                                    <span class="fileupload-input-group-btn">
                                                        <div class="fileupload-image-preview-input">
                                                            <?=$this->lang->line('page_select_file')?>
                                                            <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                        </div>
                                                    </span>
                                                </div>
                                            </form>
                                            <div class="post--upload--info">
                                                <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="media-library-right pull-left">
                                    <div class="attached-details" id="set_featured_image_type">

                                    </div>
                                </div>
                            </div>

                            <div class="footer--upload">
                                <a id="set_featured_image" data-dismiss="modal" onclick="setFileToEditor(this, 'set_featured_image_hidden_field', 'set_featured_image_type');" href="#"><?=$this->lang->line('page_set_featured_image')?></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade mediaLibrary new-pattern" id="SetSliderImages">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-body">
                <div id="setSliderImages" class="tab-pane tab-border-none">
                    <h2><?=$this->lang->line('page_slider_images')?></h2>
                    <div class="nav_custom_tabs">
                        <ul class="nav nav-tabs" id="custom_tab" role="tablist">
                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#setSliderImagesMediaUpload"><?=$this->lang->line('page_upload_files')?></a></li>
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#setSliderImagesMediaUploadLibrary"><?=$this->lang->line('page_media_library')?></a></li>
                        </ul>

                        <div class="tab-content no-padd">
                            <div id="setSliderImagesMediaUpload" class="tab-pane active">
                                <div class="drop--files">
                                    <form id="set_slider_images-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                        <input type="text" name="media_gallery_type" value="2" style="display: none">
                                        <input type="text" name="focus_id" value="setSliderImages" style="display: none">

                                        <div class="fileupload-input-group">
                                            <span class="fileupload-input-group-btn">
                                                <div class="fileupload-image-preview-input">
                                                    <?=$this->lang->line('page_select_file')?>
                                                    <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                </div>
                                            </span>
                                        </div>
                                    </form>
                                    <div class="post--upload--info">
                                        <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                    </div>
                                </div>
                            </div>

                            <div id="setSliderImagesMediaUploadLibrary" class="tab-pane clearfix">
                                <div class="media-library-left pos-rel pull-left">
                                    <?php 
                                        if(inicompute($media_gallerys_images)) {
                                            echo '<div class="attached-preview">';
                                                echo '<ul class="set_slider_images_type">';
                                            foreach ($media_gallerys_images as $media_gallerys_image_key => $media_gallerys_image) {
                                    ?>       
                                                <li class="set_slider_images_image_info" onclick="getFileInfo(this, 'set_slider_images_type', 'image',  'multi', 'set_slider_images_hidden_field', false, 'set_slider_images');" id ="<?=$media_gallerys_image->media_galleryID?>">
                                                    <div class="thumb">              
                                                        <img src="<?=base_url('uploads/gallery/'.$media_gallerys_image->file_name)?>" alt="<?=$media_gallerys_image->file_alt_text?>">
                                                    </div>
                                                </li>
                                    <?php 
                                            }
                                                echo '</ul>';  
                                            echo '</div>';
                                            echo '<input type="text" id="set_slider_images_hidden_field" style="display:none">';

                                        } else { ?>
                                        <div class="drop--files">
                                            <form id="slider_images-fileupload-list" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                                                <input type="text" name="media_gallery_type" value="2" style="display: none">
                                                <input type="text" name="focus_id" value="setSliderImages" style="display: none">
                                                <div class="fileupload-input-group">
                                                    <span class="fileupload-input-group-btn">
                                                        <div class="fileupload-image-preview-input">
                                                            <?=$this->lang->line('page_select_file')?>
                                                            <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                                        </div>
                                                    </span>
                                                </div>
                                            </form>
                                            <div class="post--upload--info">
                                                <p><?=$this->lang->line('page_maximum_upload_file_size')?></p>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="media-library-right pull-left">
                                    <div class="attached-details" id="set_slider_images_type">

                                    </div>
                                </div>
                            </div>

                            <div class="footer--upload">
                                <a id="set_slider_images" data-dismiss="modal" onclick="setFileToEditor(this, 'set_slider_images_hidden_field', 'set_slider_images_type');" href="#"><?=$this->lang->line('page_set_slider_image')?></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="margin-bottom: 50px"></div>

<?php if($this->session->flashdata('pageSubmitType')) { 
    $url = site_url('frontend/page/'.$this->session->flashdata('sesPageUrl'));
    redirect($url);
} ?>
