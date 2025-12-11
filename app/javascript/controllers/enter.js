// document.addEventListener("DOMContentLoaded", function() {

// });

// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {}
// const messageInput = document.getElementById("messageInput");
// const form = document.querySelector(".simple_form");
// messageInput.addEventListener("keyup", function (event) {
//   // Check if the Enter key is pressed
//   console.log("typing");
//   if (event.key === "Enter") {
//     // Prevent the default action of creating a new line
//     event.preventDefault();
//     // Submit the form
//     if (messageInput.value.trim() !== "") {
//       // Make sure there's input before sending
//       console.log(form);
//       form.submit();
//       messageInput.value = "";
//     }
//   }
// });
// //   }
// // }

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
