// Debounce
const saveDraft = () => {
  let timeOut;
  let input = document.getElementById("review-input").value;
  clearTimeout(timeOut);

  timeOut = setTimeout(() => {
    console.log(input);
  }, 3000);
};

document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("review-input").onkeyup = () => saveDraft();
});