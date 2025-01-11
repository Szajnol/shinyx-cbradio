
$(document).ready(function() {

    let channel = 0

    window.addEventListener('message', function(event) {
        let action = event.data.action;

        if (action === 'toggleRadio') {
          toggleRadio(true)
        }else if(action === 'editRadio') {
          $('#icon').fadeOut(0)
          $('.channel').text('OFF')
          channel = 0
        }
    });

  

  function toggleRadio(toggle){
    if (toggle == true){
      $('.radio').animate({ bottom: '1vw'}, 500);
      $('#channel').animate({ bottom: '8.3vw'}, 500);
      $('.screen').animate({ bottom: '6.6vw'}, 500);
    }else{
      $('.radio').animate({ bottom: '-20vw'}, 500);
      $('#channel').animate({ bottom: '-20vw'}, 500);
      $('.screen').animate({ bottom: '-20vw'}, 500);
    }
  }

  $('#channel').on('click', function(){
    changeChannel()
  })

  function changeChannel(){
    $('#icon').fadeOut(0)
    $('.channel').text('.--')
    setTimeout(() => {
      $('.channel').text('-.-')
      setTimeout(() => {
        $('.channel').text('--.')
              setTimeout(() => {
                $('#icon').fadeIn(0)
                if (channel == 0){
                  channel = 20
                  $("#icon").attr('class', 'fa-solid fa-box');
                  $('.channel').text('20')
                  $.post(`https://${GetParentResourceName()}/changeChannel`, JSON.stringify(channel));
                  $('#notify').play()
                }else if (channel == 20){
                  channel = 22.5
                  $("#icon").attr('class', 'fa-solid fa-truck');
                  $('.channel').text('22.5')
                  $.post(`https://${GetParentResourceName()}/changeChannel`, JSON.stringify(channel));
                }else if (channel == 22.5){
                  channel = 25
                  $("#icon").attr('class', 'fa-solid fa-trash');
                  $('.channel').text('25')
                  $.post(`https://${GetParentResourceName()}/changeChannel`, JSON.stringify(channel));
                }else if (channel == 25){
                  $('#icon').fadeOut(0)
                  channel = 0
                  $('.channel').text('OFF')
                  $.post(`https://${GetParentResourceName()}/changeChannel`, JSON.stringify(channel));
                }

              }, 300);
      }, 300);
    }, 300);
  }

  $(document).on('keyup', function(e) {
    if (e.key == "Escape") toggleRadio(false), $.post(`https://${GetParentResourceName()}/nuiFocus`);
  });


});

