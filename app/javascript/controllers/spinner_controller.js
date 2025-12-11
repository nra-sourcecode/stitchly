import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const createButton = document.getElementById("sendButton");
    const spinner = document.getElementById("spinner");
    const error = document.getElementsByClassName("invalid-feedback");

    if (spinner)
      createButton.addEventListener("click", () => {
        spinner.classList.remove("d-none");
      });
  }
}
