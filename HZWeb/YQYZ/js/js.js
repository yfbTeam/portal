(function($){
    $.fn.floatAd = function(options){
        var defaults = {
            imgSrc : "", //Ư��ͼƬ·��
            url : "", //ͼƬ�����תҳ
            openStyle : 1, //��תҳ�򿪷�ʽ 1Ϊ��ҳ���  0Ϊ��ǰҳ��
            speed : 10 //Ư���ٶ� ��λ����
        };
        var options = $.extend(defaults,options);
        var _target = options.openStyle == 1 ?  "target='_blank'" : '' ;
        var html = "<div id='float_ad' style='position:fixed;left:0px;top:0px;z-index:1000000;cleat:both;'>";
        html += "  <a href='" + options.url + "'><img src='" + options.imgSrc + "' border='0' class='float_ad_img'/></a> <a href='javascript:;' id='close_float_ad' style=''>x</a>";
        html += "</div>";

        $('body').append(html);

        function init(){
            var x = 0,y = 0 
            var xin = true, yin = true 
            var step = 1 
            var delay = 10 
            var obj=$("#float_ad") 
            obj.find('img.float_ad_img').load(function(){
                var float = function(){
                    var L = T = 0;
                    var OW = obj.width();//��ǰ���Ŀ�
                    var OH = obj.height();//��
                    var DW = $(window).width(); //��������ڵĿ�
                    var DH = $(window).height();

                    x = x + step *( xin ? 1 : -1 ); 
                    if (x < L) { 
                        xin = true; x = L
                    } 
                    if (x > DW-OW-1){//-1Ϊ��ie
                        xin = false; x = DW-OW-1
                    } 

                    y = y + step * ( yin ? 1 : -1 ); 
                    if (y > DH-OH-1) { 

                        yin = false; y = DH-OH-1 ;
                    }
                    if (y < T) {
                        yin = true; y = T
                    } 

                    var left = x ; 
                    var top = y; 

                    obj.css({'top':top,'left':left});
                }
                var itl = setInterval(float,options.speed);
                $('#float_ad').mouseover(function(){clearInterval(itl)}); 
                $('#float_ad').mouseout(function(){itl=setInterval(float, options.speed)} )
            });
            // ����ر�
            $('#close_float_ad').on('click',function(){
                $('#float_ad').hide();
            });
        }

        init();

    }; //floatAd

})(jQuery);