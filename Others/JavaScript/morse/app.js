/**
 * Morse Code Translator
 *
 * Letters should be broken up with a space.
 * Feel free to use any process for differentiating the space between letters and words
 *     I recommend something like a / or | between words; ie 'DOG CAT' => '-.. --- --. / -.- .- -'
 *
 * Also feel free to modify this code or the HTML as much as needed.  You do not need to use this structure.
 * http://safetybelt.pythonanywhere.com/letters/
**/
const translateString = char => {
  return fetch(`http://safetybelt.pythonanywhere.com/letters/${char}`).then(res => res.json()).then(resJson => resJson.code)
};

const getInput = string => {
  let chars = string.split("");
  let output = [];

  for (var i = 0; i < chars.length; i++) {
    output.push(translateString(chars[i]))
  }

  getOutput(output)
};

const getOutput = output => {
  Promise.all(output).then(value => {
    document.getElementById("result").innerHTML = values.join("");
  });
};

document.getElementById("translate").addEventListener("click", () => {
  event.preventDefault();

  let string = document.getElementById("string").value;
  getInput(string);
})
