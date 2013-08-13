xmlhttp=new XMLHttpRequest()
xmlhttp.open('POST', 'http://localhost:3000/jobs/import_job')
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
console.log("Hello");

chrome.tabs.getSelected(null, function(tab) {
  //properties of tab object
  tabUrl = tab.url;
  xmlhttp.send('url='+tabUrl);
  //rest of the save functionality.
});
console.log("Hello")
// window.close();




// $("#test").html("Hello World");

// $.ajax('http://localhost:3000/jobs/import_job',{
//   type: 'POST',
//   dataType: 'json',
//   data: {url: "http://jobs.37signals.com/jobs/13255"},
//   success: function(result) {
//     console.log(result)
//   },
//   error: console.log(":(")
// }); 