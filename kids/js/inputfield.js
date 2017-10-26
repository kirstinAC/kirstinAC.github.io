// Provides functionality for form fields that have label inside the formfield
// Label hides on focus and is restored if no user input is made

$.fn.inputfield = function() {
	return this.focus(function() {
		if( this.value == this.defaultValue ) {
			this.value = "";
		}
	}).blur(function() {
		if( !this.value.length ) {
			this.value = this.defaultValue;
		}
	});
};


$(document).ready(function(){
	$(".inputfield").inputfield();
});