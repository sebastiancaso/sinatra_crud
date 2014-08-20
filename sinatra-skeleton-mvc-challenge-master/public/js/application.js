

$(document).ready(function() {
    $("#ajaxform").submit(function(event){ //grabs form information by using id on form tag
      event.preventDefault();  //prevents page from refreshing

      var postData = $(this).serialize(); //puts information into correct format
      var formURL= $(this).attr('action');    //
      var ajaxRequest = $.ajax({
          url: formURL,
          type: "put",
          data: postData,
        });

        // event.unbind();

      ajaxRequest.done(function(response){
        $('#user_name').remove();
        $('#user_address').remove();
        $('#user_email').remove();
        $('#user_phone_number').remove();

        $('#change_info').append('<p id="user_name">' + response.name + '</p>').html();
        $('#change_info').append('<p id="user_address">' + response.address + '</p>').html();
        $('#change_info').append('<p id="user_email">' + response.email + '</p>').html();
        $('#change_info').append('<p id="user_phone_number">' + response.phone_number + '</p>').html();
      });
    });
});



