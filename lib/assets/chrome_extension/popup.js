console.log("Hello World");
 
var addHtml = {
 
  addForm: function() {
    var url = window.location.href;
    var form = document.createElement('div');
    form.innerHTML = '<form id="dynForm" action="http://localhost:3000/" method="post"><input type="hidden" name="q" value="a"></form>';
    document.body.appendChild(form);
    document.getElementById("dynForm").submit();
  }
};
 
document.addEventListener('DOMContentLoaded', function () {
  addHtml.addForm();
});
 

document.body.innerHTML += '<form id="dynForm" action="http://example.com/" method="post"><input type="hidden" name="q" value="a"></form>';
document.getElementById("dynForm").submit();
