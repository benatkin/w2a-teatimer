var endDate;
var interval;

function updateTime() {
  var currentDate = new Date();
  var difference = (endDate - currentDate) / 1000;
  var minutes = Math.floor(Math.abs(difference / 60));
  var seconds = Math.floor(Math.abs(difference % 60));
  $('.time').text(minutes + ':' + (seconds > 9 ? '' : '0') + seconds);
  if (difference < 0.9) {
    if (interval != undefined) clearInterval(interval);
    $('.time').text('0:00');
    alert('your tea is ready!');
  }
}

$(document).ready(function() {
  $('.startTimer').click(function() {
    var minutes = $(this).hasClass('green') ? 2 : 5;
    endDate = new Date();
    endDate.setTime(endDate.getTime() + minutes * 60 * 1000 + 900); 
    if (interval != undefined) clearInterval(interval);

    updateTime();
    interval = setInterval(updateTime, 100);
  });
});
