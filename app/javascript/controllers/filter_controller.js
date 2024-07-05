// app/javascript/controllers/filter_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdownButton", "dropdownItem", "allTab", "favoritesTab"]

  connect() {
    this.updateDropdownTextFromSession()
    this.dropdownItemTargets.forEach(item => {
      item.addEventListener("click", this.selectFilter.bind(this))
    })
    this.allTabTarget.addEventListener("click", this.switchToAllTab.bind(this))
    this.favoritesTabTarget.addEventListener("click", this.switchToFavoritesTab.bind(this))
    this.checkActiveTab() // Ensure correct initial state
    console.log("Filter controller connected.")
  }

  selectFilter(event) {
    event.preventDefault()
    const filter = event.currentTarget.dataset.filter
    this.dropdownButtonTarget.textContent = filter
    sessionStorage.setItem("selectedFilter", filter)
    window.location.href = event.currentTarget.href
  }

  resetFilter() {
    this.dropdownButtonTarget.textContent = "No date filter"
    sessionStorage.removeItem("selectedFilter")
  }

  switchToAllTab(event) {
    if (event) event.preventDefault()
    this.updateDropdownTextFromSession()
    this.dropdownButtonTarget.disabled = false
    window.location.href = this.allTabTarget.href
  }

  switchToFavoritesTab(event) {
    if (event) event.preventDefault()
    this.resetFilter()
    this.dropdownButtonTarget.disabled = true
    window.location.href = event.currentTarget.href
  }

  updateDropdownTextFromSession() {
    const selectedFilter = sessionStorage.getItem("selectedFilter")
    if (selectedFilter) {
      this.dropdownButtonTarget.textContent = selectedFilter
    } else {
      this.dropdownButtonTarget.textContent = "No date filter"
    }
  }

  checkActiveTab() {
    if (document.querySelector('#nav-favorites-tab').classList.contains('active')) {
      this.dropdownButtonTarget.textContent = "No date filter"
      this.dropdownButtonTarget.disabled = true
    } else {
      this.updateDropdownTextFromSession()
      this.dropdownButtonTarget.disabled = false
    }
  }
}
