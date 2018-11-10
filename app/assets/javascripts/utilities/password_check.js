document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('input[id$="password"]')
  var password_confirmation = document.querySelector('input[id$="password_confirmation"]')
  var wrongIcon = document.querySelector('.password-incorrect')
  var rightIcon = document.querySelector('.password-correct')

  if (password_confirmation) {
    var checkPasswordHandler = function(password, password_confirmation) {
      password_confirmation.addEventListener('input', function() {
        if (password_confirmation.value === "") {
          wrongIcon.classList.add('hide')
          rightIcon.classList.add('hide')
        } else if (password_confirmation.value === password.value) {
          wrongIcon.classList.add('hide')
          rightIcon.classList.remove('hide')
        } else {
          wrongIcon.classList.remove('hide')
          rightIcon.classList.add('hide')

        }
      })

      password.addEventListener('input', function() {
        if (password_confirmation.value === password.value) {
          wrongIcon.classList.add('hide')
          rightIcon.classList.remove('hide')
        } else {
          wrongIcon.classList.remove('hide')
          rightIcon.classList.add('hide')

        }
      })
    }
    
    checkPasswordHandler(password, password_confirmation)
  }
})
