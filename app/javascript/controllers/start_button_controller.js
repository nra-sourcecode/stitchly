import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("turbo:load", () => {
      const startButton = document.getElementById("start-button");

      if (startButton) {
        startButton.addEventListener("click", () => {
          startButton.classList.add("d-none");
        });
      }
    });
  }
}
