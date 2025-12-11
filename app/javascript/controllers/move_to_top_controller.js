import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Move-to-top connected");

    this.observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        mutation.addedNodes.forEach((node) => {
          // Detect a turbo-stream applied update
          if (
            node.nodeType === 1 &&
            node.classList?.contains("message") &&
            node.classList?.contains("assistant")
          ) {
            this.handleNewAssistantMessage(node);
          }
        });
      });
    });

    this.observer.observe(document.body, { childList: true, subtree: true });
  }

  disconnect() {
    this.observer.disconnect();
  }

  handleNewAssistantMessage(node) {
    const messages = document.getElementById("messages");
    const assistantMessages =
      messages.getElementsByClassName("message assistant");
    const lastMessage = assistantMessages[assistantMessages.length - 1];
    console.log("LAST MESSAGE = ", lastMessage);
    node.scrollIntoView({ behavior: "smooth" });
  }
}
