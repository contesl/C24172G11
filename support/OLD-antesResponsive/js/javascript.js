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