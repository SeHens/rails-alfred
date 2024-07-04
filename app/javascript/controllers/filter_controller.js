// app/javascript/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "favoritesLink"];

  connect() {
    this.checkFavoritesTab();
    console.log("Filter controller connected.");
  }

  filter(event) {
    event.preventDefault();
    const filterValue = event.currentTarget.innerText;
    this.buttonTarget.innerText = filterValue;
    this.updateStartups(filterValue);
  }

  updateStartups(filterValue) {
    console.log(`Filter startups by: ${filterValue}`);

    if (filterValue === "All") {
      console.log("Showing all startups");
    } else {
      console.log(`Filtering startups by: ${filterValue}`);
    }
  }

  disableDropdown() {
    this.buttonTarget.disabled = true;
    this.buttonTarget.classList.add("disabled"); // Add a class to apply custom disabled styles
  }

  enableDropdown() {
    this.buttonTarget.disabled = false;
    this.buttonTarget.classList.remove("disabled");
  }

  checkFavoritesTab() {
    const favoritesLink = this.favoritesLinkTarget;
    if (favoritesLink.classList.contains('active')) {
      this.disableDropdown();
    } else {
      this.enableDropdown();
    }
  }
}
