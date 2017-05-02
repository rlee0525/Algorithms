document.getElementById("checkbox-container").addEventListener("click", () => checkBoxes());
document.getElementById("check-all").addEventListener("click", () => checkAll());

const checkBoxes = () => {
  let inputs = document.querySelectorAll("input[type='checkbox']");
  console.log(inputs);
  let checkAll = inputs[inputs.length - 1];
  let count = 0;

  for (var i = 0; i < inputs.length - 1; i++) {
    if (inputs[i].checked === true) {
      count++;
    }
  }

  if (count === Object.keys(inputs).length - 1) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

const checkAll = () => {
  let inputs = document.querySelectorAll("input[type='checkbox']");

  if (event.target.checked) {
    for (var i = 0; i < inputs.length; i++) {
      inputs[i].checked = true;
    }
  } else {
    for (var i = 0; i < inputs.length; i++) {
      inputs[i].checked = false;
    }
  }
}
