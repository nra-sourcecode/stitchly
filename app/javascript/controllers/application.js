import { Application } from "@hotwired/stimulus";
import "./start_button";
import "./spinner";
import "./enter";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
