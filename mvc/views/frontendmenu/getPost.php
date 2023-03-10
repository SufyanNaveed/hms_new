<?php if(inicompute($postArrays)) { ?>
    <?php foreach ($postArrays as $postArray) { $rand = rand('999', '999999999999'); $rand2 = rand('999', '999999999999'); ?>
        <li class="mjs-nestedSortable-leaf" id="<?=md5($rand.'-'.$rand2)?>">
            <div class="panel panel-default ui-sortable-handle <?=$postArray->postID.'-'.$rand?>" data-id="<?=$postArray->postID?>" data-type-id="2" data-rand="<?=md5($rand.'-'.$rand2)?>">
                <div class="panel-heading ui-sortable-handle" role="tab" id="menu-item-heading-<?=$postArray->postID.'-'.$rand?>">
                    <h4 class="panel-title">
                        <a class="menu-click-button-menu collapsed menu-title-<?=$postArray->postID.'-'.$rand?>" role="button" data-toggle="collapse" data-parent="#menu-item" href="#menu-item-collapse-<?=$postArray->postID.'-'.$rand?>" aria-expanded="false" aria-controls="menu-item-collapse-<?=$postArray->postID.'-'.$rand?>">
                            <span class="menu-manage-title-text"><?=$postArray->title?></span>
                            <span class="pull-right"><?=$this->lang->line('frontendmenu_post')?></span>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </h4>
                </div>
                <div id="menu-item-collapse-<?=$postArray->postID.'-'.$rand?>" class="panel-collapse collapse ui-sortable-handle" role="tabpanel" aria-labelledby="menu-item-heading-<?=$postArray->postID.'-'.$rand?>">
                    <div class="panel-body ui-sortable-handle">
                        <form class="menu-page">
                            <div class="form-group">
                                <label for="label-<?=$postArray->postID.'-'.$rand?>"><?=$this->lang->line('frontendmenu_navigation_label')?></label>
                                <input type="text" name="" class="form-control lable-text" id="label-<?=$postArray->postID.'-'.$rand?>" value="<?=$postArray->title?>" data-title="menu-title-<?=$postArray->postID.'-'.$rand?>">
                            </div>
                            <div class="form-group ui-sortable-handle">
                                <div class="move ui-sortable-handle">
                                    <span><?=$this->lang->line('frontendmenu_move')?></span>
                                    <a href="#" rand-info="<?=$postArray->postID.'-'.$rand?>" class="data-up-one"><?=$this->lang->line('frontendmenu_up_one')?></a>
                                    <a href="#" rand-info="<?=$postArray->postID.'-'.$rand?>" class="data-down-one"><?=$this->lang->line('frontendmenu_down_one')?></a>
                                </div>
                            </div>
                            <div class="form-group ui-sortable-handle">
                                <div class="link-to-original ui-sortable-handle">
                                    <span><?=$this->lang->line('frontendmenu_orginal')?>:</span>
                                    <a target="_blank" href="<?=site_url('frontend/post/'.$postArray->url)?>"><?=$postArray->title?></a>
                                </div>
                            </div>
                            <div class="form-group ui-sortable-handle">
                                <a class="Data-remove" href="#" data-title="<?=$postArray->postID.'-'.$rand?>"><?=$this->lang->line('frontendmenu_remove')?></a>
                                <span>|</span>
                                <a old-title="<?=$postArray->title?>" class="Data-cancel" rand-info="<?=$postArray->postID.'-'.$rand?>" href="#"><?=$this->lang->line('frontendmenu_cancel')?></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </li>
    <?php } ?>
<?php } ?>