$(document).ready(function() {
    $('#example').DataTable();
} )

$(document).ready(function() {
    oTable = jQuery('#actorsTable').dataTable( {
        "bDestroy": true,
        "bAutoWidth": true,
        "bFilter": true,
        "bSort": true,
        "aaSorting": [[0]],
        "aoColumns": [
            { "bSortable": false },
            { "bSortable": true },
            { "bSortable": true },
            { "bSortable": true },
            { "bSortable": true },
            { "bSortable": true },
        ]
    } );
});

$(document).ready(function() {
    oTable = jQuery('#movieTable').dataTable( {
        "bDestroy": true,
        "bAutoWidth": true,
        "bFilter": true,
        "bSort": true,
        "aaSorting": [[0,'asc']],
        "aoColumns": [
            { "bSortable": true },
            { "bSortable": false },
            { "bSortable": true },
        ]
    } );
});

$(document).ready(function() {

    var docHeight = $(window).height();
    var footerHeight = $('#footer').height();
    var footerTop = $('#footer').position().top + footerHeight;

    if (footerTop < docHeight)
        $('#footer').css('margin-top', 10+ (docHeight - footerTop) + 'px');
});

$(function(){
    $('a').each(function(){
        if ($(this).prop('href') === window.location.href) {
            $(this).addClass('active'); $(this).parents('li').addClass('active');
        }
    });
});