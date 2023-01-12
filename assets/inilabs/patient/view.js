jQuery(document).on('click', '.viewModalBtn', function() {
  'use strict';
  let testID = jQuery(this).attr('id');
  if(parseInt(testID)) {
    jQuery.ajax({
      type: 'POST',
      url: THEMEBASEURL+'patient/testfile',
      data: {'testID': testID, [CSRFNAME] : CSRFHASH},
      dataType: 'html',
      success: function(data) {
        jQuery('.viewTestModal').html(data);
      },
    });
  }
});

jQuery(document).on('click', '#sendpdf', function () {
  'use strict';
  let to = jQuery('#to').val();
  let subject = jQuery('#subject').val();
  let message = jQuery('#message').val();
  let error = 0;

  if(to === '' || to === null) {
    error++;
    jQuery('#to_error').html('The To field is required').css('text-align', 'left').css('color', 'red');
    jQuery('#to').addClass('is-invalid').parent().addClass('text-danger');
  } else {
    jQuery('#to_error').html('');
    jQuery('#to').removeClass('is-invalid').parent().removeClass('text-danger');
    if(check_email(to) === false) {
      error++
    }
  }

  if(subject === '' || subject === null) {
    error++;
    jQuery('#subject_error').html('The Subject field is required').css('text-align', 'left').css('color', 'red');
    jQuery('#subject').addClass('is-invalid').parent().addClass('text-danger');
  } else {
    jQuery('#subject_error').html('');
    jQuery('#subject').removeClass('is-invalid').parent().removeClass('text-danger');
  }

  if (error === 0) {
    jQuery('#sendpdf').attr('disabled', 'disabled');
    jQuery.ajax({
      type : 'POST',
      url : THEMEBASEURL+'patient/sendmail',
      data : {'to' : to, 'subject' : subject, 'message' : message, 'patientID' : patientID, [ CSRFNAME ] : CSRFHASH},
      dataType : 'html',
      success : function (data) {
        let response = JSON.parse(data);
        if (response.status === false) {
          jQuery('#sendpdf').removeAttr('disabled');
          jQuery.each(response, function (index, value) {
            if (index !== 'status') {
              toastr[ 'error' ](value);
              toastr.options = {
                'closeButton' : true,
                'debug' : false,
                'newestOnTop' : false,
                'progressBar' : false,
                'positionClass' : 'toast-top-right',
                'preventDuplicates' : false,
                'onclick' : null,
                'showDuration' : '500',
                'hideDuration' : '500',
                'timeOut' : '5000',
                'extendedTimeOut' : '1000',
                'showEasing' : 'swing',
                'hideEasing' : 'linear',
                'showMethod' : 'fadeIn',
                'hideMethod' : 'fadeOut'
              }
            }
          });
        } else {
          location.reload();
        }
      }
    });
  }
});