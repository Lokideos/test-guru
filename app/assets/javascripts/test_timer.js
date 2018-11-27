document.addEventListener('turbolinks:load', function() {
  var timerBar = document.querySelector('.test-timer-bar')
  var control = document.querySelector('.next-question-button')

  if (timerBar) { 
    var endTimer = document.querySelector('.test-timer-value').innerHTML
    var remainingTime = new Date(endTimer).getTime()
    
    var timerInterval = setInterval(function() {

      var now = new Date().getTime();

      var distance = (remainingTime + 1000) - now;
      
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      document.querySelector('.test-timer-value').innerHTML = minutes + I18n.t('js.timer.minutes')
      + " " + seconds + I18n.t('js.timer.seconds');

      if (distance < 0) {
        clearInterval(timerInterval);
        document.querySelector('.test-timer-value').innerHTML = I18n.t('js.timer.expired');
        control.click()
      }
    }, 1000);
  }
});
