//文字とボタン大きさ調整
$(function(){
  $('.small').click(function(){
    $('html').css('font-size', '65.5%');
  });
  $('.medium').click(function(){
    $('html').css('font-size', '70.5%');
  });
  $('.large').click(function(){
    $('html').css('font-size', '80%');
  });
});