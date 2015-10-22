$(document).ready(function(){
  $('form#new_message').on('submit', function(event){
    event.preventDefault();
    $form = $(event.target);
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      dataType: 'HTML',
      data: $form.serialize()
    })
    .then(function(response){
      $('div#conversation').prepend(response);
    })
    .fail(function(jqXHR, textStatus, errorThrown){
      var html = '<div id="flash"><span class="alert">' + jqXHR.responseText + '</span></div>';
      $('#wrapper').prepend(html);
    });

  });
});