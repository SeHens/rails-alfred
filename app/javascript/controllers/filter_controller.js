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
    this.checkPage() // Check if we are on the show or edit page
  }

  selectFilter(event) {
    event.preventDefault()
    const filter = event.currentTarget.dataset.filter
    if (this.hasDropdownButtonTarget) {
      this.dropdownButtonTarget.textContent = filter
    }
    sessionStorage.setItem("selectedFilter", filter)
    window.location.href = event.currentTarget.href
  }

  resetFilter() {
    if (this.hasDropdownButtonTarget) {
      this.dropdownButtonTarget.textContent = "All dates"
    }
    sessionStorage.removeItem("selectedFilter")
  }

  switchToAllTab(event) {
    if (event) event.preventDefault()
    this.updateDropdownTextFromSession()
    if (this.hasDropdownButtonTarget) {
      this.dropdownButtonTarget.disabled = false
    }
    window.location.href = this.allTabTarget.href
  }

  switchToFavoritesTab(event) {
    if (event) event.preventDefault()
    this.resetFilter()
    if (this.hasDropdownButtonTarget) {
      this.dropdownButtonTarget.disabled = true
    }
    window.location.href = event.currentTarget.href
  }

  updateDropdownTextFromSession() {
    const selectedFilter = sessionStorage.getItem("selectedFilter")
    if (this.hasDropdownButtonTarget) {
      if (selectedFilter) {
        this.dropdownButtonTarget.textContent = selectedFilter
      } else {
        this.dropdownButtonTarget.textContent = "All dates"
      }
    }
  }

  checkActiveTab() {
    if (this.hasDropdownButtonTarget) {
      if (document.querySelector('#nav-favorites-tab').classList.contains('active')) {
        this.dropdownButtonTarget.textContent = "All dates"
        this.dropdownButtonTarget.disabled = true
      } else {
        this.updateDropdownTextFromSession()
        this.dropdownButtonTarget.disabled = false
      }
    }
  }

  checkPage() {
    const path = window.location.pathname
    const showEditPaths = [/\/startups\/\d+$/, /\/startups\/\d+\/edit$/] // Regex patterns for show and edit pages
    const isShowOrEditPage = showEditPaths.some(pattern => pattern.test(path))
    if (this.hasDropdownButtonTarget) {
      if (isShowOrEditPage) {
        this.dropdownButtonTarget.textContent = "All dates"
        this.dropdownButtonTarget.disabled = true
      }
    }
  }
}
