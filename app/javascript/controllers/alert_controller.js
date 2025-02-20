import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["container"];

  dismiss() {
    this.containerTarget.classList.add("opacity-0");
    setTimeout(() => {
      this.containerTarget.remove();
    }, 300);
  }
}
