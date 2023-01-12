jQuery(document).ready(function() {
  'use strict';
  jQuery('.select2').select2();
  jQuery('.datepicker').datepicker({
    format: 'dd-mm-yyyy',
    todayHighlight : true,
    autoclose:true
  });
  jQuery('.datepicker').datepicker('setDate', new Date());

  jQuery(document).on('change', '.file-upload-input', function () {
    if(this.files.length > 0) {
      jQuery('.label-text-hide').text(this.files[0].name);
    } else {
      jQuery('.label-text-hide').text('Choose file');
    }
  });

  jQuery('#uhid').parent().hide();
  jQuery(document).on('change', '#patient_type', function() {
    let patient_type = jQuery(this).val();
    if(patient_type === 'none') {
      jQuery('#uhid').parent().hide('slow');
    } else {
      jQuery('#uhid').parent().show('slow');
    }
  });

  jQuery('.paymentDiv').hide();
  jQuery(document).on('change', '#payment_status', function() {
    let payment_status = jQuery(this).val();
    if((payment_status === '1') || (payment_status === '2')) {
      jQuery('.paymentDiv').show('slow');
    } else {
      jQuery('.paymentDiv').hide('slow');
    }
  });

  jQuery('#payment_amount').on('keyup', function() {
    let productsalepaidamount =  toFixedVal(jQuery(this).val());
    if(dotAndNumber(productsalepaidamount)) {
      if(productsalepaidamount !== '' && productsalepaidamount !== null) {
        if(floatChecker(productsalepaidamount)) {
          if(productsalepaidamount.length > 15) {
            jQuery(this).val(globalsubtotal);
          } else {
            if(productsalepaidamount > globalsubtotal) {
              jQuery(this).val(globalsubtotal);
            }
          }
        }
      }
    } else {
      let productsalepaidamount = parseSentenceForNumber(jQuery(this).val());
      jQuery(this).val(productsalepaidamount);
    }
  });

  jQuery(document).on('click', '#addMedicineButton', function(event) {
    event.preventDefault();
    let error = 0;
    let field = {
      'patient_type'    : jQuery('#patient_type').val(),
      'uhid'            : jQuery('#uhid').val(),
      'medicinesaledate': jQuery('#medicinesaledate').val(),
      'payment_status'  : jQuery('#payment_status').val(),
      'reference_no'    : jQuery('#reference_no').val(),
      'payment_amount'  : jQuery('#payment_amount').val(),
      'payment_method'  : jQuery('#payment_method').val()
    };

    if (field['patient_type'] !== 'none') {
      if (field['uhid'] === '') {
        jQuery('#uhid').parent().addClass('text-danger');
        jQuery('#uhid').addClass('is-invalid');
        jQuery('#uhid-error').text('The uhid field is required.');
        error++;
      } else {
        jQuery('#uhid').parent().removeClass('text-danger');
        jQuery('#uhid').removeClass('is-invalid');
        jQuery('#uhid-error').text('');
      }
    }

    if (field['medicinesaledate'] === '') {
      jQuery('#medicinesaledate').parent().addClass('text-danger');
      jQuery('#medicinesaledate').addClass('is-invalid');
      jQuery('#medicinesaledate-error').text('The date field is required.');
      error++;
    } else {
      jQuery('#medicinesaledate').parent().removeClass('text-danger');
      jQuery('#medicinesaledate').removeClass('is-invalid');
      jQuery('#medicinesaledate-error').text('');
    }

    if (field['payment_status'] === 'none') {
      jQuery('#payment_status').parent().addClass('text-danger');
      jQuery('#payment_status').parent().children('.select2-container').addClass('is-invalid');
      jQuery('#payment_status-error').text('The payment status field is required.');
      error++;
    } else {
      if (field['payment_status'] === '0' || field['payment_status'] === '1' || field['payment_status'] === '2') {
        jQuery('#payment_status').parent().removeClass('text-danger');
        jQuery('#payment_status').parent().children('.select2-container').removeClass('is-invalid');
        jQuery('#payment_status-error').text('');
      }

      if(field['payment_status'] > 0) {
        if (field['payment_amount'] === '') {
          jQuery('#payment_amount').parent().addClass('text-danger');
          jQuery('#payment_amount').addClass('is-invalid');
          jQuery('#payment_amount-error').text('The payment amount field is required.');
          error++;
        } else {
          if (field['payment_amount'] <= 0) {
            jQuery('#payment_amount').parent().addClass('text-danger');
            jQuery('#payment_amount').addClass('is-invalid');
            jQuery('#payment_amount-error').text('The Amount field must contain a number greater than 0.');
            error++;
          } else {
            jQuery('#payment_amount').parent().removeClass('text-danger');
            jQuery('#payment_amount').removeClass('is-invalid');
            jQuery('#payment_amount-error').text('');
          }
        }

        if (field['payment_method'] === '0') {
          jQuery('#payment_method').parent().addClass('text-danger');
          jQuery('#payment_method').parent().children('.select2-container').addClass('is-invalid');
          jQuery('#payment_method-error').text('The payment method field is required.');
          error++;
        } else {
          jQuery('#payment_method').parent().removeClass('text-danger');
          jQuery('#payment_method').parent().children('.select2-container').removeClass('is-invalid');
          jQuery('#payment_method-error').text('');
        }
      }
    }

    jQuery('#medicineList tr').each(function(index, value) {
      if(jQuery(this).children().eq(2).children().eq(1).val() === '') {
        let batchID = jQuery(this).children().eq(2).children().attr('id');
        jQuery('#'+batchID).addClass('border border-danger');
        error++;
      } else {
        let batchID = jQuery(this).children().eq(2).children().attr('id');
        jQuery('#'+batchID).removeClass('border border-danger');
      }

      if(jQuery(this).children().eq(3).children().val() === '') {
        let expire_date = jQuery(this).children().eq(3).children().attr('id');
        jQuery('#'+expire_date).addClass('border border-danger');
        error++;
      } else {
        let expire_date = jQuery(this).children().eq(3).children().attr('id');
        jQuery('#'+expire_date).removeClass('border border-danger');
      }

      if(jQuery(this).children().eq(4).children().val() === '') {
        let unit_price = jQuery(this).children().eq(4).children().attr('id');
        jQuery('#'+unit_price).addClass('border border-danger');
        error++;
      } else {
        let unit_price = jQuery(this).children().eq(4).children().attr('id');
        jQuery('#'+unit_price).removeClass('border border-danger');
      }

      if(jQuery(this).children().eq(5).children().val() === '') {
        let quantity = jQuery(this).children().eq(5).children().attr('id');
        jQuery('#'+quantity).addClass('border border-danger');
        error++;
      } else {
        let quantity = jQuery(this).children().eq(5).children().attr('id');
        jQuery('#'+quantity).removeClass('border border-danger');
      }
    });

    let medicineitems = jQuery('tr[id^=tr_]').map(function(index, value){
      return {'medicineid': jQuery(this).attr('medicineid'),'medicineitemid': jQuery(this).attr('medicineitemid'), 'randid': jQuery(this).attr('randid'), 'batchID': jQuery(this).children().eq(2).children().eq(1).val(), 'expire_date': jQuery(this).children().eq(3).children().val(), 'unit_price':jQuery(this).children().eq(4).children().val(), 'quantity':jQuery(this).children().eq(5).children().val()};
    }).get();

    if (typeof medicineitems === 'undefined' || medicineitems.length <= 0) {
      error++;
      toastr['error']('The medicine item is required.');
      toastr.options = {
        'closeButton': true,
        'debug': false,
        'newestOnTop': false,
        'progressBar': false,
        'positionClass': 'toast-top-right',
        'preventDuplicates': false,
        'onclick': null,
        'showDuration': '500',
        'hideDuration': '500',
        'timeOut': '5000',
        'extendedTimeOut': '1000',
        'showEasing': 'swing',
        'hideEasing': 'linear',
        'showMethod': 'fadeIn',
        'hideMethod': 'fadeOut'
      }
    }

    medicineitems      = JSON.stringify(medicineitems);
    jQuery.ajax({
      type: 'POST',
      url: THEMEBASEURL+'medicinesale/checkmedcine',
      data: {'medicineitems': medicineitems, [CSRFNAME] : CSRFHASH},
      dataType: 'html',
      success: function(data) {
        let response = JSON.parse(data);
        jQuery('.change-medicinebatchID').removeClass('border border-danger');
        jQuery('.change-medicineexpiredate').removeClass('border border-danger');
        jQuery('.change-medicineprice').removeClass('border border-danger');
        jQuery('.change-medicinequantity').removeClass('border border-danger');
        if(response.status) {
          error++;
          let responseData = response.data;
          jQuery.each(responseData,function(index, value) {
            if(value.batchID) {
              jQuery('#medicinebatchID_'+index).addClass('border border-danger');
            } else {
              jQuery('#medicinebatchID_'+index).removeClass('border border-danger');
            }

            if(value.expiredate) {
              jQuery('#medicineexpiredate_'+index).addClass('border border-danger');
            } else {
              jQuery('#medicineexpiredate_'+index).removeClass('border border-danger');
            }

            if(value.unitprice) {
              jQuery('#medicineprice_'+index).addClass('border border-danger');
            } else {
              jQuery('#medicineprice_'+index).removeClass('border border-danger');
            }

            if(value.quantity) {
              jQuery('#medicinequantity_'+index).addClass('border border-danger');
            } else {
              jQuery('#medicinequantity_'+index).removeClass('border border-danger');
            }
          });
        }

        if(error === 0) {
          jQuery(this).attr('disabled', 'disabled');
          let formData = new FormData(jQuery('#medicinesaleDataForm')[0]);
          formData.append('medicineitems', medicineitems);
          formData.append('globalsubtotal', globalsubtotal);
          formData.append([CSRFNAME], CSRFHASH);
          makingPostDataPreviousofAjaxCall(formData);
        }
      },
    });
  });

  function makingPostDataPreviousofAjaxCall(field) {
    let passData = field;
    ajaxCall(passData);
  }

  function ajaxCall(passData) {
    jQuery.ajax({
      type: 'POST',
      url: THEMEBASEURL+'medicinesale/savemedicinesale',
      data: passData,
      async: true,
      dataType: 'html',
      success: function(data) {
        let response = JSON.parse(data);
        errorLoader(response);
      },
      cache: false,
      contentType: false,
      processData: false
    });
  }

  function errorLoader(response) {
    if(response.status) {
      window.location = THEMEBASEURL+'medicinesale/index';
    } else {
      jQuery('#addMedicineButton').removeAttr('disabled');
      toastr['error'](response.message);
      toastr.options = {
        'closeButton': true,
        'debug': false,
        'newestOnTop': false,
        'progressBar': false,
        'positionClass': 'toast-top-right',
        'preventDuplicates': false,
        'onclick': null,
        'showDuration': '500',
        'hideDuration': '500',
        'timeOut': '5000',
        'extendedTimeOut': '1000',
        'showEasing': 'swing',
        'hideEasing': 'linear',
        'showMethod': 'fadeIn',
        'hideMethod': 'fadeOut'
      }
    }
  }

  jQuery(document).on('change', '#medicinecategoryID', function () {
    let medicinecategoryID = jQuery(this).val();
    if (medicinecategoryID > 0) {
      jQuery.ajax({
        url : THEMEBASEURL + 'medicinesale/get_medicine',
        type : 'POST',
        dataType : 'html',
        data : {'medicinecategoryID' : medicinecategoryID, [ CSRFNAME ] : CSRFHASH},
        success : function (data) {
          jQuery('#medicineID').html(data);
        }
      });
    }
  });

  jQuery(document).on('change', '#medicineID', function() {
    let medicineID   = jQuery(this).val();
    let medicineName = jQuery(this).find(':selected').text();
    if(medicineID > 0) {
      jQuery.ajax({
        type: 'POST',
        url: THEMEBASEURL+'medicinesale/getmedicinebatch',
        data: {'medicineID': medicineID, [CSRFNAME] : CSRFHASH},
        dataType: 'html',
        success: function(data) {
          let response = JSON.parse(data);
          if(response.status) {
            let batchs = response.data;
            let appendData   = medicineItemDesign(medicineID, medicineName, batchs);
            jQuery('#medicineList').append(appendData['itemdesign']);
            let batchrandID = '#medicinebatchID_'+appendData['randID'];
            jQuery(batchrandID).select2();
          } else {
            toastr['error']('This medicine does not available.');
          }
        },
      });
    }
  });

  jQuery(document).on('change', '.change-medicinebatchID', function() {
    let medicinebatchQuantity   = jQuery(this).find(':selected').data('quantity');
    let medicinebatchExpiredate = jQuery(this).find(':selected').data('expiredate');
    let medicineitemid          = jQuery(this).find(':selected').data('medicineitemid');
    let randID      = jQuery(this).parent().parent().attr('randid');
    jQuery(this).parent().parent().attr('medicineitemid', medicineitemid);


    if(medicinebatchExpiredate === 'undefined') {
      jQuery('#medicineexpiredate_'+randID).val('');
    } else {
      jQuery('#medicineexpiredate_'+randID).val(medicinebatchExpiredate);
    }

    jQuery('#medicinequantity_'+randID).val('');
    if(medicinebatchQuantity === 'undefined') {
      jQuery('#medicinequantity_'+randID).removeAttr('max');
    } else {
      jQuery('#medicinequantity_'+randID).attr('max',medicinebatchQuantity);
    }
  });

  function medicineItemDesign(medicineID, medicineName, batchs) {
    let medicineobj = myMedicineobj;
    let randID      = getRandomInt();
    let lastTdNumber = '';

    if(jQuery('#medicineList tr:last').text() === '') {
      lastTdNumber = 0;
    } else {
      lastTdNumber = jQuery('#medicineList tr:last td:eq(0)').text();
    }

    let medicineobjinfo = null;
    if(typeof(medicineobj) === 'object') {
      if(typeof(medicineobj[medicineID]) === 'object') {
        medicineobjinfo = medicineobj[medicineID];
      } else {
        medicineobjinfo = {'medicineID' : medicineID, 'selling_price' : '0'};
      }
    } else {
      medicineobjinfo = {'medicineID' : medicineID, 'selling_price' : '0'};
    }

    lastTdNumber = parseInt(lastTdNumber);
    lastTdNumber++;

    let text = '<tr id="tr_'+randID+'" medicineid="'+medicineID+'" medicineitemid="0" randid="'+randID+'">';
    text += '<td >';
    text += lastTdNumber;
    text += '</td>';

    text += '<td>';
    text += medicineName;
    text += '</td>';

    text += '<td>';
    text += '<select class="form-control small-select2 change-medicinebatchID" id="medicinebatchID_'+randID+'">';
    text += '<option value="0">'+medicinesale_please_select+'</option>';
    jQuery(batchs).each(function(index, value) {
      text += '<option data-medicineitemid="'+value.medicineitemid+'" data-expiredate="'+value.expiredate+'" data-quantity="'+value.quantity+'" value="'+ value.batchID +'">'+ value.batchID +'</option>';
    });
    text += '</select>';
    text += '</td>';

    text += '<td>';
    text += ('<input style="background-color: #fff;" type="text" class="form-control change-medicineexpiredate datepicker" readonly id="medicineexpiredate_'+randID+'">');
    text += '</td>';

    text += '<td>';
    text += ('<input type="text" class="form-control change-medicineprice" id="medicineprice_'+randID+'" value="'+medicineobjinfo.selling_price+'" data-medicineprice-id="'+randID+'">');
    text += '</td>';


    text += '<td>';
    text += ('<input type="text" class="form-control change-medicinequantity" id="medicinequantity_'+randID+'" data-medicinequantity-id="'+randID+'">' );
    text += '</td>';

    text += '<td id="medicinetotal_'+randID+'">';
    text += '0.00';
    text += '</td>';

    text += '<td  >';
    text += ('<a href="#" class="btn btn-danger btn-sm deleteBtn" id="medicineaction_'+randID+'" data-medicineaction-id="'+randID+'"><i class="fa fa-trash-o"></i></a>');
    text += '</td>';
    text += '</tr>';

    let retData = [];
    retData['itemdesign'] = text;
    retData['randID']     = randID;
    return retData;
  }

  let globalsubtotal = 0;
  function totalInfo() {
    let totalQuantity = 0;
    let totalSubtotal = 0;
    jQuery('#medicineList tr').each(function(index, value) {
      if(jQuery(this).children().eq(5).children().val() !== '' && jQuery(this).children().eq(5).children().val() !== null) {
        let quantity = parseFloat(jQuery(this).children().eq(5).children().val());
        let subtotal = parseFloat(jQuery(this).children().eq(6).text().replace(/,/gi, ''));
        totalQuantity += quantity;
        totalSubtotal += subtotal;
      }
    });
    globalsubtotal = totalSubtotal;
    jQuery('#totalQuantity').text(currencyConvert(totalQuantity));
    jQuery('#totalSubtotal').text(currencyConvert(totalSubtotal));
  }

  jQuery(document).on('keyup', '.change-medicineprice', function() {
    let medicinePrice    =  toFixedVal(jQuery(this).val());
    let medicinePriceID  = jQuery(this).attr('data-medicineprice-id');
    let medicineQuantity = toFixedVal(jQuery('#medicinequantity_'+medicinePriceID).val());

    if(dotAndNumber(medicinePrice)) {
      if(medicinePrice.length > 15) {
        medicinePrice = lenChecker(medicinePrice, 15);
        jQuery(this).val(medicinePrice);
      }

      if((medicinePrice !== '' && medicinePrice !== null) && (medicineQuantity !== '' && medicineQuantity !== null)) {
        if(floatChecker(medicinePrice)) {
          if(medicinePrice.length > 15) {
            medicinePrice = lenChecker(medicinePrice, 15);
            jQuery(this).val(medicinePrice);
            jQuery('#medicinetotal_'+medicinePriceID).text(currencyConvert(medicinePrice*medicineQuantity));
            totalInfo();
          } else {
            jQuery('#medicinetotal_'+medicinePriceID).text(currencyConvert(medicinePrice*medicineQuantity));
            totalInfo();
          }
        }
      } else {
        jQuery('#medicinetotal_'+medicinePriceID).text('0.00');
        totalInfo();
      }
    } else {
      medicinePrice = parseSentenceForNumber(jQuery(this).val());
      jQuery(this).val(medicinePrice);
    }
  });

  jQuery(document).on('keyup', '.change-medicinequantity', function() {
    let gettrID            = jQuery(this).parent().parent().attr('id');
    let getmedicineID      = jQuery(this).parent().parent().attr('medicineid');
    let medicineQuantity   = toFixedVal(jQuery(this).val());
    let medicineQuantityID = jQuery(this).attr('data-medicinequantity-id');
    let medicinePrice      = toFixedVal(jQuery('#medicineprice_'+medicineQuantityID).val());
    let batchID            = jQuery('#medicinebatchID_'+medicineQuantityID).val();


    if(dotAndNumber(medicineQuantity)) {
      if((medicineQuantity !== '' && medicineQuantity !== null) && (medicinePrice !== '' && medicinePrice !== null) && (batchID !== '' && batchID !== null)) {
        if(floatChecker(medicineQuantity)) {
          totalUnitQuantity(gettrID, getmedicineID, batchID, medicineQuantity);
          medicineQuantity = totalUnitQuantityAmount(gettrID, getmedicineID, batchID, medicineQuantity);
          jQuery('#medicinetotal_'+medicineQuantityID).text(currencyConvert(medicineQuantity*medicinePrice));
          totalInfo();
        }
      } else {
        jQuery('#medicinetotal_'+medicineQuantityID).text('0.00');
        totalUnitQuantity(gettrID, getmedicineID, batchID, medicineQuantity);
        totalInfo();
      }
    } else {
      medicineQuantity = parseSentenceForNumber(toFixedVal(jQuery(this).val()));
      jQuery(this).val(medicineQuantity);
      totalUnitQuantity(gettrID, getmedicineID, batchID, medicineQuantity);
    }
  });

  function totalUnitQuantity(gettrID, getmedicineID, getbatchID, medicineQuantity) {
    let totalQuantity = 0;
    let maxValue      = 0;
    let quantity      = 0;
    jQuery('#medicineList tr').each(function(index, value) {
      let trID       = jQuery(value).attr('id');
      let medicineID = jQuery(value).attr('medicineid');
      let batchID    = jQuery(value).children().eq(2).children().eq(1).val();

      if(jQuery(this).children().eq(5).children().val() !== '' && jQuery(this).children().eq(5).children().val() !== null) {
        if((trID !== gettrID) && (parseInt(medicineID) === parseInt(getmedicineID)) && (getbatchID === batchID)) {
          totalQuantity += parseFloat(jQuery(value).children().eq(5).children().val());
        }
      }
    });

    maxValue = parseFloat(jQuery('#'+gettrID).children().eq(5).children().attr('max'));

    quantity = (maxValue - totalQuantity);
    if(medicineQuantity > quantity) {
      jQuery('#'+gettrID).children().eq(5).children().val(quantity);
    }
  }

  function totalUnitQuantityAmount(gettrID, getmedicineID, getbatchID, medicineQuantity) {
    let totalQuantity = 0;
    let maxValue      = 0;
    let quantity      = 0;
    jQuery('#medicineList tr').each(function(index, value) {
      let trID = jQuery(value).attr('id');
      let medicineID = jQuery(value).attr('medicineid');
      let batchID    = jQuery(value).children().eq(2).children().eq(1).val();

      if(jQuery(this).children().eq(5).children().val() !== '' && jQuery(this).children().eq(5).children().val() !== null) {
        if((trID !== gettrID) && (parseInt(medicineID) === parseInt(getmedicineID)) && (getbatchID === batchID)) {
          totalQuantity += parseFloat(jQuery(value).children().eq(5).children().val());
        }
      }
    });

    maxValue = parseFloat(jQuery('#'+gettrID).children().eq(5).children().attr('max'));
    quantity = (maxValue - totalQuantity);
    if(medicineQuantity > quantity) {
      return quantity;
    } else {
      return medicineQuantity;
    }
  }

  jQuery(document).on('click', '.deleteBtn', function(e) {
    e.preventDefault();
    let medicineItemID = jQuery(this).attr('data-medicineaction-id');
    jQuery('#tr_'+medicineItemID).remove();

    let i = 1;
    jQuery('#medicineList tr').each(function(index, value) {
      jQuery(this).children().eq(0).text(i);
      i++;
    });
    totalInfo();
  });

  function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
  }

  function floatChecker(value) {
    let val = value;
    if(isNumeric(val)) {
      return true;
    } else {
      return false;
    }
  }

  function dotAndNumber(data) {
    let retArray = [];
    let fltFlag = true;
    if(data.length > 0) {
      for(let i = 0; i <= (data.length-1); i++) {
        if(i === 0 && data.charAt(i) === '.') {
          fltFlag = false;
          retArray.push(true);
        } else {
          if(data.charAt(i) === '.' && fltFlag === true) {
            retArray.push(true);
            fltFlag = false;
          } else {
            if(isNumeric(data.charAt(i))) {
              retArray.push(true);
            } else {
              retArray.push(false);
            }
          }

        }
      }
    }

    if(jQuery.inArray(false, retArray) ==  -1) {
      return true;
    }
    return false;
  }

  function parseSentenceForNumber(sentence) {
    let matches = sentence.replace(/,/g, '').match(/(\+|-)?((\d+(\.\d+)?)|(\.\d+))/);
    return matches && matches[0] || null;
  }

  function getRandomInt() {
    return Math.floor(Math.random() * Math.floor(9999999999999999));
  }

  function currencyConvert(data) {
    return data.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  }

  function toFixedVal(x) {
    if (Math.abs(x) < 1.0) {
      let e = parseFloat(x.toString().split('e-')[1]);
      if (e) {
        x *= Math.pow(10,e-1);
        x = '0.' + (new Array(e)).join('0') + x.toString().substring(2);
      }
    } else {
      let e = parseFloat(x.toString().split('+')[1]);
      if (e > 20) {
        e -= 20;
        x /= Math.pow(10,e);
        x += (new Array(e+1)).join('0');
      }
    }
    return x;
  }

  function lenChecker(data, len) {
    let retdata = 0;
    let lencount = 0;
    data = toFixedVal(data);
    if(data.length > len) {
      lencount = (data.length - len);
      data = data.toString();
      data = data.slice(0, -lencount);
      retdata = parseFloat(data);
    } else {
      retdata = parseFloat(data);
    }
    return toFixedVal(retdata);
  }
});
