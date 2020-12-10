

YAHOO.util.Event.onDOMReady(function(){
    YAHOO.util.Event.addListener('name', 'change', function () {
        var id = $('#name').val();
        alert(id);
       
    });
});