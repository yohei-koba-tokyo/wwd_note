
// ユーザーのフォロー済み等の絞り込みを行うラジオボタンの、選択解除を可能にするための記述です
window.onload = function() {
  if(document.querySelector('input#followers')) {
    var sel = 0;
    function check_reset(mod, num){
      if(sel == num){
        mod.checked = false;
        sel = 0;
      } else {
        sel = num;
      }
    }
    const followers = document.getElementById('followers');
    const followings = document.getElementById('followings');
    followers.addEventListener("click", function() {
      check_reset(this, 1);
    });
    followings.addEventListener("click", function() {
      check_reset(this, 2);
    });
  }
}