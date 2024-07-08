// app/javascript/controllers/switch_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["switch", "text"]

  connect() {
    console.log("Switch controller connected.")
    document.addEventListener('typewriter:finished', this.showSwitch.bind(this));
  }

  showSwitch() {
    console.log("Showing switch");
    this.textTarget.style.display = 'block';
    this.switchTarget.style.display = 'block';
  }

  toggleSwitch(event) {
    if (event.currentTarget.checked) {
      const url = event.currentTarget.dataset.url;
      setTimeout(() => {
        window.open(url, '_blank');
      }, 1000);
    }
  }
}
