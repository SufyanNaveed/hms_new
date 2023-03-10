
<h2><?=$this->lang->line('post_create_gallery')?></h2>
<div class="nav_custom_tabs">
    <ul class="nav nav-tabs" id="custom_tab" role="tablist">
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#createGalleryMediaUpload"><?=$this->lang->line('post_upload_files')?></a></li>
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#createGalleryMediaUploadLibrary"><?=$this->lang->line('post_media_library')?></a></li>
    </ul>

    <div class="tab-content no-padd">
        <div id="createGalleryMediaUpload" class="tab-pane">
            <div class="drop--files">
                <form id="create_gallery-fileupload" class="form-horizontal" action=""  method="post" enctype="multipart/form-data">
                    <input type="text" name="media_gallery_type" value="2" style="display: none">
                    <input type="text" name="focus_id" value="createGallery" style="display: none">
                    <div class="fileupload-input-group">
                        <span class="fileupload-input-group-btn">
                            <div class="fileupload-image-preview-input">
                                <?=$this->lang->line('post_select_file')?>
                                <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                            </div>
                        </span>
                    </div>
                </form>
                <div class="post--upload--info">
                    <p><?=$this->lang->line('post_maximum_upload_file_size')?></p>
                </div>
            </div>
        </div>

        <div id="createGalleryMediaUploadLibrary" class="tab-pane clearfix active">
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
                                        <?=$this->lang->line('post_select_file')?>
                                        <input onchange="fileUpload(this);" class="fileupload-event-image" type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                    </div>
                                </span>
                            </div>
                        </form>
                        <div class="post--upload--info">
                            <p><?=$this->lang->line('post_maximum_upload_file_size')?></p>
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
            <a data-dismiss="modal" id="create_a_new_gallery" onclick="setFileToEditor(this, 'create_gallery_hidden_field', 'create_gallery_type');"  href="#"><?=$this->lang->line('post_create_a_new_gallery')?></a>
        </div>
    </div>
</div>