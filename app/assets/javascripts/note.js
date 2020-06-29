// ノートフォームの文字数カウンターです

if(document.URL.match(/notes\//)) {
  window.onload = function() {
    function counter(count) {
      if (count <= 255) {
        var text = count + "/255"
      } else {
        var text =  "+" + count - 255 + "文字オーバーしています"
      }
      return text
    }

    const what = document.getElementById("note_what")
    const whatCounter = document.querySelector("p.counter_what")
    
    const why = document.getElementById("note_why")
    const whyCounter = document.querySelector("p.counter_why")
    
    const feeling = document.getElementById("note_feeling_detail")
    const feelingCounter = document.querySelector("p.counter_feeling")
    
    const challenge = document.getElementById("note_challenge")
    const challengeCounter = document.querySelector("p.counter_challenge")
    
    what.addEventListener('keyup', function () {
      var count = this.value.length;
      whatCounter.innerHTML = counter(count);
      count <= 255 ? whatCounter.classList.remove('red_alert') : whatCounter.classList.add('red_alert')
    })
    why.addEventListener('keyup', function () {
      var count = this.value.length;
      whyCounter.innerHTML = counter(count);
      count <= 255 ? whyCounter.classList.remove('red_alert') : whyCounter.classList.add('red_alert')
    })
    feeling.addEventListener('keyup', function () {
      var count = this.value.length;
      feelingCounter.innerHTML = counter(count);
      count <= 255 ? feelingCounter.classList.remove('red_alert') : feelingCounter.classList.add('red_alert')
    })
    challenge.addEventListener('keyup', function () {
      var count = this.value.length;
      challengeCounter.innerHTML = counter(count);
      count <= 255 ? challengeCounter.classList.remove('red_alert') : challengeCounter.classList.add('red_alert')
    })
  }
}