import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]

  connect() {
    // Add event listener for tab clicks
    document.querySelectorAll('.nav-item.nav-link').forEach(tab => {
      tab.addEventListener('click', () => {
        // Delay the call to updateInvestmentsText slightly to ensure the active class is updated
        setTimeout(() => {
          this.updateInvestmentsText();
        }, 100);
      });
    });
  }

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
      this.updateInvestmentsText(data.count)
    }).catch(error => {
      console.error("There was a problem with the fetch operation:", error)
    })
  }

  updateInvestmentsText(count) {
    count = count || document.querySelector('.count').textContent.trim();
    const favoriteTabActive = document.querySelector('.nav-item.nav-link.active').id === 'nav-favorites-tab';
    const investmentsText = favoriteTabActive ? `${count} favorite(s) selected.` : `${count} investments to watch for you.`;
    document.querySelector('.count').textContent = count;
    document.querySelector('.investments-text').textContent = investmentsText;
  }

}