import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Move-to-top connected");

    this.observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        mutation.addedNodes.forEach((node) => {
          console.log("NODE", node);
          // Detect a turbo-stream applied update
          if (node.nodeType === 1) {
            console.log(node.classList[1]);
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
    if (node.classList.contains?.("assistant")) {
      const messages = document.getElementById("messages");
      const assistantMessages =
        messages.getElementsByClassName("message assistant");
      const lastMessage = assistantMessages[assistantMessages.length - 1];
      console.log("LAST MESSAGE = ", lastMessage);
      lastMessage.scrollIntoView({ behavior: "smooth" });
    }
  }
}
