




window.onload = function() {

  // const html =
  // `
  
  
  // `
  // return html


  const prevWeekButton = document.getElementById("prev-week")
  const nextWeekButton = document.getElementById("next-week")
  let weekIndex = 0
  
  function createCalendar(index) {
    console.log(index)
  }

  prevWeekButton.addEventListener("click", function(){
    weekIndex++
    createCalendar(weekIndex)
  });
  nextWeekButton.addEventListener("click", function(){
    weekIndex--
    createCalendar(weekIndex)
  });
  
}