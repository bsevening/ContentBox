<cfoutput>
<script language="javascript">
$(document).ready(function() {
    var $installerForm = $("##installerForm")
	// form validators
	$installerForm.validate({
        showErrors: function( errorMap, errorList ) {
            var errors = this.numberOfInvalids();
            if ( errors ) {
                var msg = '<p><strong>Please correct the following errors:</strong></p><ul>';
                for( var i=0; i<errors; i++ ) {
                    var label = $("label[for='"+$(errorList[ i ].element).attr('id')+"']");
                    msg += '<li>' + label.text() + ' ' + errorList[ i ].message + '</li>';
                }
                msg += '</ul>';
                var wall = $("##errorBar").addClass("alert alert-error").fadeIn().html( msg );
            }
        }
    });
	
	// password validator
	$.validator.addMethod( 'passwordmatch', function( value, element ) {
        return (value==$("[name=password]").val()) ? true : false;
    }, 'Passwords need to match' );
});

function nextStep(){
    var $tabs = $('.tabbable li');
	$tabs.filter('.active').next('li').find('a[data-toggle="tab"]').tab('show');
}
function prevStep(){
    var $tabs = $('.tabbable li');
	$tabs.filter('.active').prev('li').find('a[data-toggle="tab"]').tab('show');
}
</script>
</cfoutput>