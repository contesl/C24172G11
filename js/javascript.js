function confirmExit() {
    if (confirm("¿Está seguro que quiere volver a la página principal?")) {
        window.location = '../index.html';
    }
}
function ScrollMarquee() {

    window.setTimeout('ScrollMarquee()', ScrollSpeed);

    var msg = document.Cart_form.Message.value;

    document.Cart_form.Message.value = msg.substring(ScrollChars) + msg.substring(0, ScrollChars);

}
var nMonth = 0;
function isMonth(mnth) {
    m = mnth.toUpperCase();
    if (m == "JAN") { nMonth = 1; }
    else if (m == "FEB") { nMonth = 2; }
    else if (m == "MAR") { nMonth = 3; }
    else if (m == "APR") { nMonth = 4; }
    else if (m == "MAY") { nMonth = 5; }
    else if (m == "JUN") { nMonth = 6; }
    else if (m == "JUL") { nMonth = 7; }
    else if (m == "AUG") { nMonth = 8; }
    else if (m == "SEP") { nMonth = 9; }
    else if (m == "OCT") { nMonth = 10; }
    else if (m == "NOV") { nMonth = 11; }
    else if (m == "DEC") { nMonth = 12; }

    if (nMonth > 0) { return true; }
    return false;
}
function isValidDate(date_Field) {
    /* 	if the month is valid, we can then use JavaScript to return what it thinks is the month.  
        If the return value does not match the entered value, this is not a valid date.  */

    var sDate = date_Field.value;
    var vDate = new Date(date_Field.value);
    var vjMonth = vDate.getMonth();
    var sMonth = vDate.toString();
    var nDelim = 0;
    var subMonth;
    var bValid = false;

    // lets see if this is '/' delimited, or space delimited
    nDelim = sDate.indexOf("/");

    if (nDelim > 0) { 		 //  '/' delimited now we need to get the numeric value
        nMonth = parseInt(sDate.substring(0, nDelim), 10);
        if (nMonth >= 1 && nMonth <= 12) {
            // window.alert("valid Month value " + nMonth);
            bValid = true;
        }
        else {				// window.alert("invalid " + nMonth);
        }
    } else { 	// space delimited, but is it still numeric or alpha???
        nDelim = sDate.indexOf(" ");
        if (nDelim == 1 || nDelim == 2) {		// should be numeric
            nMonth = parseInt(sDate.substring(0, nDelim), 10);
            if (nMonth >= 1 && nMonth <= 12) {
                // window.alert("valid " + nMonth);
                bValid = true;
            }
            else {
                // window.alert("invalid month " + nMonth); 
            }
        }
        else if (isMonth(sDate.substring(0, 3))) {
            // window.alert("valid month " + sDate.substring(0,3));
            bValid = true;
        }
        else {
            // window.alert("invalid alpha month " + sDate.substring(0,3));
        }
    }


    if (bValid == true) {
        // window.alert("nMonth: " + nMonth);
        // window.alert("vjMonth: " + vjMonth);

        if (nMonth == (vjMonth + 1)) {
            // window.alert ("The Date is Valid");
            return true;
        }
    }

    window.alert("Date is Invalid, please reenter");

    date_Field.focus();
    date_Field.select();

    return false;
}
ScrollSpeed = 200;  // milliseconds between scrolls

ScrollChars = 1;    // chars scrolled per time period

function ScrollMarquee() {

    window.setTimeout('ScrollMarquee()', ScrollSpeed);

    var msg = document.Order_form.Marquee.value;

    document.Order_form.Marquee.value = msg.substring(ScrollChars) + msg.substring(0, ScrollChars);

}


