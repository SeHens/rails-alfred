// app/javascript/controllers/button_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "text"];

  connect() {
    console.log("Hello from button_controller.js");
    // Listen for the custom event to show the button and text
    document.addEventListener('typewriter:finished', this.showElements.bind(this));
  }

  showElements() {
    console.log("Showing elements"); // Debugging log
    this.textTarget.style.display = 'block';
    this.buttonTarget.style.display = 'block';
  }
}
