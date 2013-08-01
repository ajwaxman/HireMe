// console.log("Hello World");
 
// var addHtml = {
 
//   addForm: function() {
//     var url = window.location.href;
//     var form = document.createElement('div');
//     form.innerHTML = '<form id="dynForm" action="http://localhost:3000/jobs/import_job" method="post"><input type="hidden" name="q" value="a"></form>';
//     document.body.appendChild(form);
//     document.getElementById("dynForm").submit();
//   }
// };
 
// document.addEventListener('DOMContentLoaded', function () {
//   addHtml.addForm();
// });
 

// document.body.innerHTML += '<form id="dynForm" action="http://example.com/" method="post"><input type="hidden" name="q" value="a"></form>';
// document.getElementById("dynForm").submit();

// focusedWindowId = undefined;
// currentWindowId = undefined;
 
//   function bootStrap() {
//     chrome.windows.getCurrent(function(currentWindow) {
//       currentWindowId = currentWindow.id;
//       chrome.windows.getLastFocused(function(focusedWindow) {
//         focusedWindowId = focusedWindow.id;
//         loadWindowList();
//       });
//     });
//   }


xmlhttp=new XMLHttpRequest()
xmlhttp.open('POST', 'http://localhost:3000/jobs/import_job')
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");

chrome.tabs.getSelected(null, function(tab) {
  //properties of tab object
  tabUrl = tab.url;
  xmlhttp.send('url='+tabUrl)
  //rest of the save functionality.
});