$(function(){
   
    //상품상세 이미지 변경
    var $productPictures = $('.product_pictures'),
        $bigImg = $productPictures.find('.big_img'),
        $thumbImgList = $productPictures.find('.thumb_img li');

        /*
        리스트를 클릭하면 
        클릭한 그 요소의 active 추가한다.
        클릭한 그 요소의 자식요소 img의 data-target속성의 값을 확인해서
        큰 이미지의 경로를 수정해야 한다.        
        */
       $thumbImgList.click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            var targetImgPath = 'resources/images/close/goods/' + $(this).find('img').attr('data-target');

            $bigImg.attr('src',targetImgPath);
       });

       //상품 수량 가격 변경하기
     /*  var $quantity = $('.quantity'),
           $unitprice =  $quantity.attr('data-unitprice'),
           $qtyBtn = $quantity.find('span'),
           $qytInput = $quantity.find('input'),
           $tagetTotal = $('.total_price .price');*/

           /*
           $qtyBtn클릭하면 그 요소가 class명 plus 있다면
           참이면 (플러스를 클릭했으면)
           $qytInput value 기존값에서 1증가
           거짓이면(마이너스를 클릭했으면)
           $qytInput value 기존값에서 1차감
           */
        /*$qtyBtn.click(function(){
            var currentCount = $qytInput.val();

            if($(this).hasClass('plus')){                
                $qytInput.val(++currentCount);
            }else{
                if(currentCount > 1){                    
                    $qytInput.val(--currentCount);
                }
            }*/
            //수량*단가 변수 total에 저장하고 그걸 .price 값으로 변경되도록 한다.
          /*  var total = (currentCount * $unitprice).toLocaleString('en');
            
            $tagetTotal.text(total + '$');
*/
        /*});*/ // $qtyBtn.click

});//document ready function