import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]

  toggle(event) {
    event.preventDefault()
    const startupId = this.element.dataset.startupId
    const url = this.element.classList.contains("fa-regular") ? `/startups/${startupId}/favorite` : `/startups/${startupId}/unfavorite`
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
    }).catch(error => {
      console.error("There was a problem with the fetch operation:", error)
    })
  }
}
