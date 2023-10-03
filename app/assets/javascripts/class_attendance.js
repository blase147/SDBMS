// application.js (or a separate JavaScript file)
$(document).on('turbolinks:load', function() {
    $('.editable-field').on('blur', function() {
      console.log('Blur event triggered');
      var newValue = $(this).val();
      var attendanceId = $(this).data('attendance_id');
      var url = '/attendances/' + attendanceId; 
      var data = {
        attendance: {
          presence: newValue, 
          health_condition: newValue,
          arrival_time: newValue, 
          departure_time: newValue 
        }
      };
            
      $.ajax({
        url: url,
        method: 'POST', 
        data: data,
        success: function(response) {
          console.log('Success');
        },
        error: function() {
          console.log('Error');
        }
      });
    });
  });

