$(function(){
  var menulist = $(".Tags li");
  var contentlist = $(".Tasks li");
  var border = $(".border div");

  menulist.on("click",function(){
      var selected = menulist.index($(this));
      menulist.removeClass("show").eq(selected).addClass("show");
      contentlist.removeClass("show").eq(selected).addClass("show");
      if(selected === 0){
          border.css("left","0%");
      }else if(selected === 1){
          border.css("left","33.3%");
      }else if(selected === 2){
          border.css("left","66.6%");
      }else{
          console.log(error);
      }
  });
});