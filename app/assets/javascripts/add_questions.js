$(function() {
	$('.login-box input[type="text"]').on("focus", function(){
	  $('span.username').addClass('.add-on-username');
	});

	$('#add_question').on('click', function() { 

	  $('#questions').append('<div class="question"><input type="text" name="comment[questions][]"><button class="remove btn"><i class="fa-icon-remove blue"></i></button></div>');
	  return false; //prevent form submis
	});

	$('#questions').on('click', '.remove', function() {
    $(this).parent().remove();
    return false; //prevent form submissionsion
	});
});