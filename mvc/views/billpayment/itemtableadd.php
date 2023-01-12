
<?php if(inicompute($patient)) { ?>
    <div class="row">
        <div class="col-sm-4">
            <div class="box box-primary">
                <div class="box-body box-profile box-border" >
                    <img src="<?=imagelink($patient->photo,'uploads/user')?>" class="profile-user-img mx-auto d-block rounded-circle profile-height" alt="">
                    <h3 class="profile-username text-center text-size"><?=$patient->name?></h3>
                    <p class="text-muted text-center"><?=inicompute($designation) ? $designation->designation : ''?></p>
                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item list-group-item-background">
                            <b><?=$this->lang->line('billpayment_uhid')?></b> <a class="pull-right"><?=$patient->patientID?></a>
                        </li>
                        <li class="list-group-item list-group-item-background">
                            <b><?=$this->lang->line('billpayment_type')?></b>
                            <a class="pull-right">
                                <?php
                                if($patient->patienttypeID == 0) {
                                    echo $this->lang->line('billpayment_opd');
                                } elseif($patient->patienttypeID == 5) {
                                    echo $this->lang->line('billpayment_register');
                                } else {
                                    echo $this->lang->line('billpayment_ipd');
                                }
                                ?>
                            </a>
                        </li>
                        <li class="list-group-item list-group-item-background" >
                            <b><?=$this->lang->line('billpayment_gender')?></b> <a class="pull-right"><?=($patient->gender == '1')? $this->lang->line('billpayment_male'): $this->lang->line('billpayment_female')?></a>
                        </li>
                        <li class="list-group-item list-group-item-background">
                            <b><?=$this->lang->line('billpayment_age')?></b> <a class="pull-right"><?=stringtoage($patient->age_day, $patient->age_month, $patient->age_year)?></a>
                        </li>
                        <li class="list-group-item list-group-item-background">
                            <b><?=$this->lang->line('billpayment_phone')?></b> <a class="pull-right"><?=$patient->phone?></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <?php if(inicompute($unpaidbills)) { ?>
                <ul class="list-group list-group-unbordered list-group-item-margin">
                    <li class="list-group-item list-group-item-background">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th><?=$this->lang->line('billpayment_billno')?></th>
                                    <th><?=$this->lang->line('billpayment_date')?></th>
                                    <th><?=$this->lang->line('billpayment_amount')?></th>
                                    <th><?=$this->lang->line('billpayment_payment')?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $totalAmount = 0; $i = 0; foreach ($unpaidbills as $unpaidbill) { $totalAmount += $unpaidbill->totalamount; ?>
                                    <tr class="tableBody">
                                        <td><?=$unpaidbill->billID?></td>
                                        <td><?=app_datetime($unpaidbill->date)?></td>
                                        <td><?=app_currency_format($unpaidbill->totalamount)?></td>
                                        <td><?=app_currency_format(0)?></td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                                <tfoot class="tableFoot">
                                <tr>
                                    <td colspan="2"><?=$this->lang->line('billpayment_total')?></td>
                                    <td><?=app_currency_format($totalAmount)?></td>
                                    <td><?=app_currency_format(0)?></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </li>
                </ul>
            <?php } ?>

            <ul class="list-group list-group-unbordered">
                <li class="list-group-item list-group-item-background">
                    <form method="POST">
                        <input type="hidden" name="<?=$this->security->get_csrf_token_name()?>" value="<?=$this->security->get_csrf_hash()?>" />
                        <div class="card-block">
                            <div class="form-group <?=form_error('due') ? 'text-danger' : '' ?>">
                                <label class="control-label" for="due"><?=$this->lang->line('billpayment_due')?></label>
                                <div class="input-group mb-3">
                                    <input type="text" disabled="disabled" class="form-control <?=form_error('due') ? 'is-invalid' : ''?>" name="due" id="due" value="<?=$dueamount?>">
                                    <?php if(permissionChecker('billpayment_view')) { ?>
                                        <div class="input-group-append">
                                            <span class="input-group-text border" id="basic-addon2"><a class="text-decoration" target="_blank" href="<?=site_url('billpayment/details/'.$displayID.'/'.$displayuhID)?>" ><?=$this->lang->line('billpayment_details')?></a></span>
                                        </div>
                                    <?php } ?>
                                </div>
                                <span><?=form_error('due')?></span>
                            </div>
                            <div class="form-group <?=form_error('reference_no') ? 'text-danger' : '' ?>">
                                <label class="control-label" for="reference_no"><?=$this->lang->line('billpayment_reference_no')?></label>
                                <input type="text" class="form-control <?=form_error('reference_no') ? 'is-invalid' : '' ?>" id="reference_no" name="reference_no"  value="<?=set_value('reference_no')?>">
                                <span><?=form_error('reference_no')?></span>
                            </div>
                            <div class="form-group <?=form_error('amount') ? 'text-danger' : '' ?>">
                                <label class="control-label" for="amount"><?=$this->lang->line('billpayment_amount')?><span class="text-danger"> *</span></label>
                                <input type="text" min="1" class="form-control <?=form_error('amount') ? 'is-invalid' : '' ?>" id="amount" name="amount"  value="<?=set_value('amount')?>">
                                <span id="amount-error"><?=form_error('amount')?></span>
                            </div>
                            <div class="form-group paymentmethodDiv <?=form_error('paymentmethod') ? 'text-danger' : '' ?>">
                                <label class="control-label" for="paymentmethod"><?=$this->lang->line('billpayment_payment_method')?><span class="text-danger"> *</span></label>
                                <?php
                                $paymentmethodArray['0']  = '— '.$this->lang->line('billpayment_please_select').' —';
                                $paymentmethodArray['1']  = $this->lang->line('billpayment_cash');
                                $paymentmethodArray['2']  = $this->lang->line('billpayment_cheque');
                                $paymentmethodArray['3']  = $this->lang->line('billpayment_credit_card');
                                $paymentmethodArray['4']  = $this->lang->line('billpayment_other');

                                $errorClass = form_error('paymentmethod') ? 'is-invalid' : '';
                                echo form_dropdown('paymentmethod', $paymentmethodArray,  set_value('paymentmethod'), ' id="paymentmethod" class="form-control select2 '.$errorClass.'" ')?>
                                <span id="paymentmethod-error"><?=form_error('paymentmethod')?></span>
                            </div>
                            <button type="submit" class="btn btn-primary"><?=$this->lang->line('billpayment_payment')?></button>
                        </div>
                    </form>
                </li>
            </ul>
        </div>
    </div>
<?php } ?>