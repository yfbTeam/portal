function enumSystemType(type) {
    var msg = "";
    switch (type) {
        case "最新导读": msg = 79; break;
    }
    return msg;
}

function escape2Html(str) {
    var arrEntities = { 'lt': '<', 'gt': '>', 'nbsp': ' ', 'amp': '&', 'quot': '"' };
    return str.replace(/&(lt|gt|nbsp|amp|quot);/ig, function (all, t) { return arrEntities[t]; });
}

$(function () {
    
    var initHeight = (function () {
        if ($('#header_top')) {
            var windowHeight = parseInt($(window).height());
            $('#centerwrap').css({ 'minHeight': windowHeight - 487 + 'px' });
        }
        
    })();
})
