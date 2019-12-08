document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.valid-input')

  if (control) { control.addEventListener('input', validateInput) }
})

function validateInput() {
  var password = document.querySelector('input#user_password').value
//  var password = document.querySelectorAll('input')
  var password_confirm = document.querySelector('input#user_password_confirmation').value
  if (password === password_confirm) {
    //console.log(document.querySelector('.octicon-check'))
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-alert').classList.add('hide')
  } else {
    //console.log(document.querySelector('.octicon-alert'))
    document.querySelector('.octicon-alert').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  }
  if (password_confirm === ''){
    document.querySelector('.octicon-alert').classList.add('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  }
}
