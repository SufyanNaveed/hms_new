<article class="content">
    <div class="row">
        <div class="col-sm-4">
            <h3 class="title"><i class="fa ini-itemcategory"></i> <?=$this->lang->line('panel_title')?> </h3>
        </div>
        <div class="col-sm-8 pull-right">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb pull-right themebreadcrumb">
                <li class="breadcrumb-item"><a href="<?=site_url('dashboard/index')?>"><i class="fa fa-laptop"></i> <?=$this->lang->line('menu_dashboard')?></a></li>
                <li class="breadcrumb-item active" aria-current="page"><?=$this->lang->line('menu_itemcategory')?></li>
              </ol>
            </nav>
        </div>
    </div>
    <section class="section">
        <div class="row">
            <?php if(permissionChecker('itemcategory_add')) { ?>
                <div class="col-sm-4">
                    <div class="card card-custom">
                        <div class="card-header">
                            <div class="header-block">
                                <p class="title"> <i class="fa fa-plus-square-o"></i> &nbsp;<?=$this->lang->line('panel_add')?></p>
                            </div>
                        </div>
                        <form role="form" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="<?=$this->security->get_csrf_token_name()?>" value="<?=$this->security->get_csrf_hash()?>" />
                            <div class="card-block">
                                <div class="form-group <?=form_error('name') ? 'text-danger' : '' ?>">
                                    <label class="control-label" for="name"><?=$this->lang->line('itemcategory_name')?><span class="text-danger"> *</span></label>
                                    <input type="text" class="form-control <?=form_error('name') ? 'is-invalid' : '' ?>" id="name" name="name"  value="<?=set_value('name')?>">
                                    <span><?=form_error('name')?></span>
                                </div>
                                <div class="form-group <?=form_error('description') ? 'text-danger' : '' ?>">
                                    <label class="control-label" for="description"><?=$this->lang->line('itemcategory_description')?></label>
                                    <textarea type="text" class="form-control <?=form_error('description') ? 'is-invalid' : '' ?>" id="description" name="description" rows="4"><?=set_value('description')?></textarea>
                                    <span><?=form_error('description')?></span>
                                </div>
                            </div>
                            <div class="card-footer"> 
                                <button type="submit" class="btn btn-primary"><?=$this->lang->line('itemcategory_add')?></button>
                            </div>
                        </form>
                    </div>
                </div>
            <?php } ?>
            <div class="<?=(permissionChecker('itemcategory_add') ? 'col-sm-8' : 'col-sm-12')?>">
                <div class="card card-custom">
                    <div class="card-header">
                        <div class="header-block">
                            <p class="title"><i class="fa fa-table"></i>&nbsp;<?=$this->lang->line('panel_list')?></p>
                        </div>
                    </div>
                    <div class="card-block">
                        <?php $this->load->view('itemcategory/table'); ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</article>
                