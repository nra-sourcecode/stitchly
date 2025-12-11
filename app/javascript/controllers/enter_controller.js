// document.addEventListener("DOMContentLoaded", function() {

// });

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("turbo:load", () => {
      const messageInput = document.getElementById("messageInput");
      const form = document.querySelector(".simple_form");

      if (!messageInput || !form) return; // Safety check

      messageInput.addEventListener("keydown", function (event) {
        if (event.key === "Enter") {
          event.preventDefault();

          if (messageInput.value.trim() !== "") {
            form.requestSubmit(); // preferred with Turbo
            messageInput.value = "";
          }
        }
      });
    });
  }
}
