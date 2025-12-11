import { Application } from "@hotwired/stimulus";
import "start_button.js";
import "spinner.js";
import "enter.js";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
