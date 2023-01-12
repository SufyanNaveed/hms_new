

<article class="content">
    <div class="row">
        <div class="col-sm-4">
            <h3 class="title"><i class="fa ini-emailsetting"></i> <?=$this->lang->line('panel_title')?></h3>
        </div>
        <div class="col-sm-8 pull-right">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb pull-right themebreadcrumb">
                    <li class="breadcrumb-item"><a href="<?= site_url('dashboard/index') ?>"><i class="fa fa-laptop"></i> <?=$this->lang->line('menu_dashboard')?></a></li>
                    <li class="breadcrumb-item active" aria-current="page"><?=$this->lang->line('menu_zoomsettings')?></li>
              </ol>
            </nav>
        </div>
    </div>
    <section class="section">
        <div class="row">
            <div class="col-sm-12">
                <div class="card card-block">
                <form role="form" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="<?=$this->security->get_csrf_token_name()?>" value="<?=$this->security->get_csrf_hash()?>" />
        <div class="box-body">
            <fieldset class="setting-fieldset">
                <legend class="setting-legend"><?=$this->lang->line('zoomsettings_zoom_configaration')?></legend>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group <?php if(form_error('client_id')) { echo 'has-error'; } ?>">
                            <div class="col-sm-12">
                                <label for="client_id"><?=$this->lang->line("zoomsettings_client_id")?> <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="bottom" title="Zoom client id. login your zoom accout and go to marketplace.zoom.us and generate a auth access"></i>
                                </label>
                                <input type="text" class="form-control" id="client_id" name="client_id" value="<?=set_value('client_id', $zoomsetting->client_id)?>" >
                                <span class="control-label">
                                    <?php echo form_error('client_id'); ?>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group <?php if(form_error('client_secret')) { echo 'has-error'; } ?>">
                            <div class="col-sm-12">
                                <label for="client_secret">
                                    <?=$this->lang->line("zoomsettings_client_secret")?> <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="bottom" title="Zoom client secret"></i>
                                </label>
                                <input type="text" class="form-control" id="client_secret" name="client_secret" value="<?=set_value('client_secret', $zoomsetting->client_secret)?>" >
                                <span class="control-label">
                                    <?php echo form_error('client_secret'); ?>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group <?php if(form_error('api_key')) { echo 'has-error'; } ?>">
                            <div class="col-sm-12">
                                <label for="api_key">
                                    <?=$this->lang->line("zoomsettings_api_key")?> <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="bottom" title="login your zoom accout and go to marketplace.zoom.us and generate a JWT acces"></i>
                                </label>
                                <input type="text" class="form-control" id="api_key" name="api_key" value="<?=set_value('api_key', $zoomsetting->api_key)?>" >
                                <span class="control-label">
                                    <?php echo form_error('api_key'); ?>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group <?php if(form_error('api_secret')) { echo 'has-error'; } ?>">
                            <div class="col-sm-12">
                                <label for="api_secret">
                                    <?=$this->lang->line("zoomsettings_api_secret")?> <i class="fa fa-question-circle" data-toggle="tooltip" data-placement="bottom" title="Zoom API secret"></i>
                                </label>
                                <input type="text" class="form-control" id="api_secret" name="api_secret" value="<?=set_value('api_secret', $zoomsetting->api_secret)?>" >
                                <span class="control-label">
                                    <?php echo form_error('api_secret'); ?>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>

            <div class="form-group row">
                <div class="col-sm-3">
                    <input type="submit" class="btn btn-success btn-md" value="<?=$this->lang->line("update_zoomsettings")?>" >
                </div>

                <div class="col-sm-3">
                    <?php if($zoomsetting->client_id && $zoomsetting->client_secret) { ?>
                        <a class="btn btn-warning" href="<?=$activationLink?>">Now active your auth</a>
                    <?php } ?>
                </div>
            </div>
        </div>
    </form>
                </div>
            </div>
        </div>
    </section>
</article>




