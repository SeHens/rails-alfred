// app/javascript/controllers/filter_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdownButton", "dropdownItem", "allTab", "favoritesTab"]

  connect() {
    this.updateDropdownTextFromSession()
    this.dropdownItemTargets.forEach(item => {
      item.addEventListener("click", this.selectFilter.bind(this))
    })
    this.allTabTarget.addEventListener("click", this.resetFilter.bind(this))
    this.favoritesTabTarget.addEventListener("click", this.resetFilter.bind(this))
    console.log("Filter controller connected.")
  }

  selectFilter(event) {
    event.preventDefault()
    const filter = event.currentTarget.dataset.filter
    this.dropdownButtonTarget.textContent = filter
    sessionStorage.setItem("selectedFilter", filter)
    window.location.href = event.currentTarget.href
  }

  updateDropdownTextFromSession() {
    const selectedFilter = sessionStorage.getItem("selectedFilter")
    if (selectedFilter) {
      this.dropdownButtonTarget.textContent = selectedFilter
    }
  }

  resetFilter() {
    sessionStorage.removeItem("selectedFilter")
    this.dropdownButtonTarget.textContent = "No date selected"
  }
}
