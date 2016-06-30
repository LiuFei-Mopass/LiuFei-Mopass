    $(function(){  
        bindTabEvent();  
        bindTabMenuEvent(); 
        
    });  
 
    //绑定tab的双击事件、右键事件  
function bindTabEvent(){  
    $(".tabs-inner").live('dblclick',function(){  
        var subtitle = $(this).children("span").text();  
        if($(this).next().is('.tabs-close')){  
            $('#tabs').tabs('close',subtitle);  
        }  
    });  
    $(".tabs-inner").live('contextmenu',function(e){  
        $('#mm').menu('show', {  
            left: e.pageX,  
            top: e.pageY  
     });  
     var subtitle =$(this).children("span").text();  
     $('#mm').data("currtab",subtitle);  
     return false;  
    });  
 }  



//绑定tab右键菜单事件  
function bindTabMenuEvent() {  
    //关闭当前  
    $('#mm-tabclose').click(function() {  
        var currtab_title = $('#mm').data("currtab");  
        if ($(this).next().is('.tabs-close')) {  
            $('#tabs').tabs('close', currtab_title);  
        }  
    });  
    //全部关闭  
    $('#mm-tabcloseall').click(function() {  
        $('.tabs-inner span').each(function(i, n) {  
            if ($(this).parent().next().is('.tabs-close')) {  
                var t = $(n).text();  
                $('#tabs').tabs('close', t);  
            }  
        });  
    });  
    //关闭除当前之外的TAB  
    $('#mm-tabcloseother').click(function() {  
        var currtab_title = $('#mm').data("currtab");  
        $('.tabs-inner span').each(function(i, n) {  
            if ($(this).parent().next().is('.tabs-close')) {  
                var t = $(n).text();  
                if (t != currtab_title)  
                    $('#tabs').tabs('close', t);  
            }  
        });  
    });  
    //关闭当前右侧的TAB  
    $('#mm-tabcloseright').click(function() {  
        var nextall = $('.tabs-selected').nextAll();  
        if (nextall.length == 0) {  
            alert('已经是最后一个了');  
            return false;  
        }  
        nextall.each(function(i, n) {  
            if ($('a.tabs-close', $(n)).length > 0) {  
                var t = $('a:eq(0) span', $(n)).text();  
                $('#tabs').tabs('close', t);  
            }  
        });  
        return false;  
    });  
    //关闭当前左侧的TAB  
    $('#mm-tabcloseleft').click(function() {  
        var prevall = $('.tabs-selected').prevAll();  
        if (prevall.length == 1) {  
            alert('已经是第一个了');  
            return false;  
        }  
        prevall.each(function(i, n) {  
            if ($('a.tabs-close', $(n)).length > 0) {  
                var t = $('a:eq(0) span', $(n)).text();  
                $('#tabs').tabs('close', t);  
            }  
        });  
        return false;  
    });  
} 