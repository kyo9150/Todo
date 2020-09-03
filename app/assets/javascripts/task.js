$(function() {
 
  // ボタンをクリックしたら発動
  $('.Newtask').on('click',function(){
    console.log("aaaaa"); 
    // 1.5秒かけてゆっくりフェードインさせる
    $('.Task-form').fadeIn(1000);
 
  });
});