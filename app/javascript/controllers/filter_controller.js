// app/javascript/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "favoritesLink"]

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
    const url = new URL('/alfred/startups', window.location.origin);
    url.searchParams.append('filter', filterValue);

    fetch(url, {
      method: 'GET',
      headers: {
        "Accept": "text/html",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      credentials: "same-origin"
    }).then(response => {
      if (response.ok) {
        return response.text();
      } else {
        throw new Error("Network response was not ok.");
      }
    }).then(html => {
      document.querySelector("#startups-container").innerHTML = html;
    }).catch(error => {
      console.error("There was a problem with the fetch operation:", error);
    });
  }

  disableDropdown() {
    this.buttonTarget.disabled = true;
    this.buttonTarget.classList.add("disabled");
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
