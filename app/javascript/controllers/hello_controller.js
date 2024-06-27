// app/javascript/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["output"];

  connect() {
    console.log("Hello from hello_controller.js");

    // Start blinking immediately for 2 seconds
    this.startBlinking();

    // After 3 seconds, start typing text
    setTimeout(() => {
      this.typewriter();
    }, 3000);
  }

  typewriter() {
    const text = "alfred."; // Replace with your desired text
    const speed = 100; // Speed of typing in milliseconds

    let i = 0;
    const typeWriter = () => {
      if (i < text.length) {
        this.outputTarget.textContent += text.charAt(i);
        i++;
        setTimeout(typeWriter, speed);
      } else {
        // Typing finished, ensure cursor keeps blinking
        this.startBlinking();
      }
    };

    typeWriter();
  }

  startBlinking() {
    // Add a class that makes the cursor blink
    this.outputTarget.classList.add("blinking-cursor");
  }
}
