xmlhttp=new XMLHttpRequest()
xmlhttp.open('POST', 'http://localhost:3000/jobs/import_job')
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

chrome.tabs.getSelected(null, function(tab) {
  //properties of tab object
  tabUrl = tab.url;
  xmlhttp.send('url='+tabUrl)
  //rest of the save functionality.
});

$("#test").html("Hello World");