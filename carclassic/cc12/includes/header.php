<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<script type="text/javascript" src="js/gistfile1.js"></script>

<link href="css/cc12_styles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="http://fast.fonts.com/jsapi/d5770fc1-c15c-4bc3-9044-9dffbbb8e87d.js"></script>

<script type="text/javascript">
    <!--
    $(function () {
        // basic version is: $('div.demo marquee').marquee() - but we're doing some sexy extras
        
        $('marquee').marquee('pointer').mouseover(function () {
            $(this).trigger('stop');
        }).mouseout(function () {
            $(this).trigger('start');
        }).mousemove(function (event) {
            if ($(this).data('drag') == true) {
                this.scrollLeft = $(this).data('scrollX') + ($(this).data('x') - event.clientX);
            }
        }).mousedown(function (event) {
            $(this).data('drag', true).data('x', event.clientX).data('scrollX', this.scrollLeft);
        }).mouseup(function () {
            $(this).data('drag', false);
        });
    });
    //-->
    </script>
