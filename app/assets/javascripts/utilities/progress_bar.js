document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('div[class$="progress-bar"]')

  if (progressBar) {
    var testPassageId = document.querySelector('div[class$="progress-percent-counter"]').dataset.testPassageId
    showProgress(testPassageId)
  }
})

function showProgress(testPassageId) {
  var currentProgress = parseFloat(document.querySelector(
                        '.test-progress-percent-counter[data-test-passage-id="' + testPassageId + '"]').textContent
  )

  if (currentProgress) {
    var progress = document.querySelector('div[class$="current-progress"]')
    progress.style.width = currentProgress + "%"
  }
}