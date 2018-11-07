document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
});

function sortRowsByTitle() {
  var table = document.querySelector('div[class$="-table"]')

  // NodeList
  // https://developer.mozilla.org/en-US/docs/Web/API/NodeList
  var rows = table.querySelectorAll('ul')
  var sortedRows = []

  // select all table rows except the first one, which is header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  sortedRows.sort(compareRowAsc)
  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('div')

  sortedTable.classList.add('tests-table')
  sortedTable.appendChild(rows[0])

  var tableContent = document.createElement('div')
  tableContent.classList.add('table-content')  
  
  for (var i = 0; i < sortedRows.length; i++) {
    tableContent.appendChild(sortedRows[i])
  }

  sortedTable.appendChild(tableContent)

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowAsc(row1, row2) {
  var testTitle1 = row1.querySelector('li').textContent
  var testTitle2 = row2.querySelector('li').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowDesc(row1, row2) {
  var testTitle1 = row1.querySelector('li').textContent
  var testTitle2 = row2.querySelector('li').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}