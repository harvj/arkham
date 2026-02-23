import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["expansion", "visiting"]

  connect() {
    this.update()
  }

  update() {
    if (!this.hasVisitingTarget) return

    const enabled = this.expansionTarget.checked

    this.visitingTarget.disabled = !enabled

    if (!enabled) {
      this.visitingTarget.checked = false
    }
  }

  toggle() {
    this.update()
  }
}
