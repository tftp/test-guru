document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer')
  if (control.innerText !== 0) { timerPassing() }
})

function timerPassing(){
  var timer = document.querySelector('.timer');
  var time = timer.innerText;
  console.log(time);

}
