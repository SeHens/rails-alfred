// app/javascript/controllers/confirmable_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    message: String
  }

  connect() {
    console.log("Confirmable controller connected");
  }

  confirm(event) {
    if (!window.confirm(this.messageValue)) {
      event.preventDefault();
    }
  }
}
