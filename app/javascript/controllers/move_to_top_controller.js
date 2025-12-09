import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Move-to-top connected");

    this.observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        mutation.addedNodes.forEach((node) => {
          // Detect a turbo-stream applied update
          if (node.nodeType === 1) {
            // console.log(node.classList[1]);
            this.handleNewMessage(node);
          }
        });
      });
    });

    this.observer.observe(document.body, { childList: true, subtree: true });
  }

  disconnect() {
    this.observer.disconnect();
  }

  handleNewMessage(node) {
    // if (node.classList.contains?.("user")) {
    const messages = document.getElementById("messages");
    const assistantMessages =
      messages.getElementsByClassName("message assistant");
    const lastMessage = assistantMessages[assistantMessages.length - 1];
    console.log("LAST MESSAGE = ", lastMessage);
    lastMessage.scrollIntoView({ behavior: "smooth" });
    // }
  }
}

// if (node.matches?.("message user"))

// debugger;
// console.log(element.getElementsByClassName("message assistant"));
// debugger;
// element.style.height = "3500px";
// const currentMessagesHeight = element.offsetHeight;
// console.log(currentMessagesHeight);
// element.style.height = String(currentMessagesHeight + 200) + "px";
// element.style.marginBottom = "200px";

// element.scrollIntoView({ behavior: "smooth" });
// window.scrollTo(0, document.body.scrollHeight);
// element.scrollTop = messages.scrollHeight;
// node.style.height = "4000px";
// set the height
// scroll up
// Do whatever (scroll, highlight, notify user, etc)
