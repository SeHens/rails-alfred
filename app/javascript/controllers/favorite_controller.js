// app/javascript/controllers/favorite_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]

  connect() {
    console.log("Favorite controller connected.")
  }

  toggle(event) {
    event.preventDefault()

    // Check if the element has the data-favorites-tab attribute set to true
    if (this.element.dataset.favoritesTab === "true") {
      return // Do nothing if we are in the Favorites tab
    }

    const startupId = this.element.dataset.startupId
    const url = this.element.classList.contains("fa-regular") ? `/alfred/startups/${startupId}/favorite` : `/alfred/startups/${startupId}/unfavorite`
    const method = this.element.classList.contains("fa-regular") ? "PATCH" : "PATCH"

    fetch(url, {
      method: method,
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      }
    }).then(response => {
      if (response.ok) {
        return response.json()
      } else {
        throw new Error("Network response was not ok.")
      }
    }).then(data => {
      if (data.status === 'favorited') {
        this.element.classList.remove("fa-regular")
        this.element.classList.add("fa-solid")
      } else if (data.status === 'unfavorited') {
        this.element.classList.remove("fa-solid")
        this.element.classList.add("fa-regular")
      }
      this.updateInvestmentsText(data.count)
    }).catch(error => {
      console.error("There was a problem with the fetch operation:", error)
    })
  }

  updateInvestmentsText(count) {
    const favoriteTabActive = document.querySelector('.nav-item.nav-link.active').id === 'nav-favorites-tab';
    const investmentsText = favoriteTabActive ? `${count} favorite(s) selected.` : `${count} investments to watch for you.`;
    document.querySelector('.count').textContent = count;
    document.querySelector('.investments-text').textContent = investmentsText;
  }
}
