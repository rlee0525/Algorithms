document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("save-draft").onclick = () => saveDraft();
  document.getElementById("review-input").onkeyup = () => saveDraft();
});

let timeOut;

function saveDraft() {
  let text = document.getElementById("review-input").value;
  clearTimeout(timeOut);

  timeOut = setTimeout(function() {
    console.log(text);
  }, 3000);
}