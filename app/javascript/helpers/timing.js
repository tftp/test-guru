document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer')
  if (control.innerText !== 0) { startTimer() }
})


function startTimer(){
  var timer = document.querySelector('.timer');
  var time = timer.innerText;
  var arr = [];
  if (!time.includes(':')){
    arr[0] = parseInt(time / 60);
    arr[1] = time % 60;
  } else {
    arr = time.split(":");
  }
  var m = arr[0];
  var s = arr[1];
  if (s == 0) {
    if (m == 0) {
      //alert ("Time out");
      //window.location.reload();
      document.querySelector('form').submit();
      return;
    }
    m--;
    if (m < 10) m = "0" + m;
    s = 59;
  }
  else s--;
  if (s < 10) s = "0" + s;
  document.querySelector('.timer').innerText = m+":"+s;
  setTimeout(startTimer, 1000);
}
