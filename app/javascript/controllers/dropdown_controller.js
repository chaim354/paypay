import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown"]
  timeout = null
  ishovering = false

  show() {
    clearTimeout(this.timeout) // Prevent hiding if mouse re-enters quickly
    this.dropdownTarget.classList.remove("hidden")
  }

  dropShow() {
    console.log("show")
    this.ishovering = true
  }
  ishoverin() {
    return this.ishovering
  }
  scheduleHide() {
    this.timeout = setTimeout(() => {
      console.log(this.ishoverin())
      if (!this.ishoverin()) {
        console.log(this.ishovering)
        this.hide()
      }
    }, 200) // Delay in milliseconds
  }

  hide() {
    this.dropdownTarget.classList.add("hidden")
    this.ishovering = false
  }
}