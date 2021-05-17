/* 해당 페이지는 메인페이지 슬라이더를 담당합니다
$(function(){
    var $searchBtn = $('.shopping_nav .search_btn'),
        $searchForm = $('header form');

    $searchBtn.click(function(){
        $searchForm.toggleClass('active');
    });

        $('.main_slides ul').bxSlider({
        controls:false,
        auto:true,
        mode:'vertical',
        speed:500,
        paper:true,
        autoHover:true
    });

    var rateForm = $('.rateform'),
        rateBtn = rateForm.find('.vote span'),
        rateInput = rateForm.find('input');

    rateBtn.click(function(){
        var $this = $(this);
        var rateScore = $this.attr('data-rate');
        rateInput.val(rateScore);
        rateBtn.removeClass('active');

        rateBtn.each(function(idx){           
            if(idx < rateScore){
                $(this).addClass('active');
            }
        });
    });
	
	$thumb_img.click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            var targetImgPath = 'images/' + $(this).find('img').attr('data-target');

            $big_img.attr('src',targetImgPath);
       });
});//document ready function */