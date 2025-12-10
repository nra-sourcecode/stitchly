// document.addEventListener("DOMContentLoaded", () => {
const form = document.getElementById("new_project");
const spinner = document.getElementById("spinner");

form.addEventListener("submit", () => {
  console.log("hello");
  spinner.classList.remove("d-none");
});
// });
