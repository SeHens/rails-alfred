// app/javascript/controllers/button_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button"];

  connect() {
    console.log("Hello from button_controller.js");
    // Listen for the custom event to show the button
    document.addEventListener('typewriter:finished', this.showButton.bind(this));
  }

  showButton() {
    console.log("Showing button"); // Debugging log
    this.buttonTarget.style.display = 'block';
  }
}
