$(document).on("turbolinks:load", function() {
    var i = $("iframe");
    var p = $('p');
    var sd = $("span:contains('Descrição')");
    var st = $("span:contains('Trailer')");
    i.hide();
    st.css("background", "white");
    
    $("span:contains('Trailer')").click(function() {
       i.show();
       $("p").hide();
       sd.css("background", "white");
       st.css("background", "goldenrod");
    });
    
    $("span:contains('Descrição')").click(function() {
       i.hide();
       p.show();
       st.css("background", "white");
       sd.css("background", "goldenrod");
    });
});