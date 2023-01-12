<!DOCTYPE html>
<html>
    <head></head>
<body>
    <div class="report">
        <div class="reportfor">
            <h3><?=$this->lang->line('accountledgerreport_report_for')?> - <?=$this->lang->line('accountledgerreport_account_ledger')?></h3>
        </div>
        <div>
            <?php if($from_date && $to_date ) { ?>
                <h6 class="pull-left report-pulllabel">
                    <?=$this->lang->line('accountledgerreport_from_date')?> : <?=date('d M Y',$from_date)?>
                </h6>
                <h6 class="pull-right report-pulllabel">
                    <?=$this->lang->line('accountledgerreport_to_date')?> : <?=date('d M Y',$to_date)?>
                </h6>
            <?php } elseif($from_date) { ?>
                <h6 class="pull-left report-pulllabel">
                    <?=$this->lang->line('accountledgerreport_from_date')?> : <?=date('d M Y',$from_date)?>
                </h6>
            <?php } ?>
        </div>
        <div class="main_account_ledger_report">
            <div class="single_account_ledger_report">
                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_income')?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><?=$this->lang->line('accountledgerreport_income_description')?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                            <td class="text-right"><?=number_format($income->amount,2)?></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <tbody>
                    <tr>
                        <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_expense')?></td>
                    </tr>
                    <tr>
                        <td colspan="2"><?=$this->lang->line('accountledgerreport_expense_description')?></td>
                    </tr>
                    <tr>
                        <td><?=$this->lang->line('accountledgerreport_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                        <td class="text-right"><?=number_format($expense->amount,2)?></td>
                    </tr>
                    </tbody>
                </table>

                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_total_balance')?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_income')?> (+)</td>
                            <td class="text-right"><?=number_format($income->amount,2)?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_medicine_sale')?> (+)</td>
                            <td class="text-right"><?=number_format($medicinesalepaid->medicinesalepaidamount,2)?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_bill')?> (+)</td>
                            <td class="text-right"><?=number_format($billpayment->paymentamount,2)?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_ambulance')?> (+)</td>
                            <td class="text-right"><?=number_format($ambulancecallAmount,2)?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_expense')?> (-)</td>
                            <td class="text-right"><?=number_format($expense->amount,2)?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_medicine_purchase')?> (-)</td>
                            <td class="text-right"><?=number_format($medicinepurchasepaid->medicinepurchasepaidamount,2)?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_salary')?> (-)</td>
                            <td class="text-right"><?=number_format($makepayment->payment_amount,2)?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_grand_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                            <td class="text-right">
                                <?php 
                                    $total_amount = 0;
                                    $total_amount += $income->amount;
                                    $total_amount += $medicinesalepaid->medicinesalepaidamount;
                                    $total_amount += $billpayment->paymentamount;
                                    $total_amount -= $expense->amount;
                                    $total_amount -= $medicinepurchasepaid->medicinepurchasepaidamount;
                                    $total_amount -= $makepayment->payment_amount;
                                    echo number_format($total_amount, 2);
                                ?>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="single_account_ledger_report">
                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_medicine_purchase')?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><?=$this->lang->line('accountledgerreport_medicine_purchase_description')?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                            <td class="text-right"><?=number_format($medicinepurchasepaid->medicinepurchasepaidamount,2)?></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_medicine_sale')?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><?=$this->lang->line('accountledgerreport_medicine_sale_description')?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                            <td class="text-right"><?=number_format($medicinesalepaid->medicinesalepaidamount,2)?></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_bill')?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><?=$this->lang->line('accountledgerreport_bill_description')?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                            <td class="text-right"><?=number_format($billpayment->paymentamount,2)?></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_salary')?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><?=$this->lang->line('accountledgerreport_salary_description')?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                            <td class="text-right"><?=number_format($makepayment->payment_amount,2)?></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" class="font-weight-bold"><?=$this->lang->line('accountledgerreport_ambulance')?></td>
                        </tr>
                        <tr>
                            <td colspan="2"><?=$this->lang->line('accountledgerreport_ambulance_description')?></td>
                        </tr>
                        <tr>
                            <td><?=$this->lang->line('accountledgerreport_total')?> <span class="font-weight-bold"><?=!empty($generalsettings->currency_code) ? "(".$generalsettings->currency_code.")" : ''?></span></td>
                            <td class="text-right"><?=number_format($ambulancecallAmount,2)?></td>
                        </tr>
                    </tbody>
                </table>
            </div>                        
        </div>
    </div>
</body>
</html>