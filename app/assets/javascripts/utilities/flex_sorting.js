document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-tests')

  if (control) { control.addEventListener('click', sortFlexByTitle) }
});

function sortFlexByTitle() {
  var flexGrid = document.querySelector('.tests-grid')

  var flexElements = flexGrid.querySelectorAll('.test-picker')
  var sortedFlexElements = []

  for (var i = 0; i < flexElements.length; i++) {
    sortedFlexElements.push(flexElements[i])
  }

  if (this.classList.contains('sort-tests-trigger')) {
    sortedFlexElements.sort(compareFlexElementsAsc)
    this.classList.remove('sort-tests-trigger')
  } else {
    sortedFlexElements.sort(compareFlexElementsDesc)
    this.classList.add('sort-tests-trigger')
  }

  var sortedFlexGrid = document.createElement('div')

  sortedFlexGrid.classList.add('tests-grid')

  for (var i = 0; i < sortedFlexElements.length; i++) {
    sortedFlexGrid.appendChild(sortedFlexElements[i])
  }

  flexGrid.parentNode.replaceChild(sortedFlexGrid, flexGrid)  
}

function compareFlexElementsAsc(element1, element2) {
  var flexTitle1 = element1.querySelector('p[class="test-title"]').textContent
  var flexTitle2 = element2.querySelector('p[class="test-title"]').textContent

  if (flexTitle1 < flexTitle2) { return -1 }
  if (flexTitle1 > flexTitle2) { return 1 }
  return 0
}

function compareFlexElementsDesc(element1, element2) {
  var flexTitle1 = element1.querySelector('p[class="test-title"]').textContent
  var flexTitle2 = element2.querySelector('p[class="test-title"]').textContent

  if (flexTitle1 < flexTitle2) { return 1 }
  if (flexTitle1 > flexTitle2) { return -1 }
  return 0
}
