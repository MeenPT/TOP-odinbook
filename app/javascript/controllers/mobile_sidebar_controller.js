import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="mobile-sidebar"
export default class extends Controller {
  static targets = ["drawer", "overlay"];

  open() {
    this.drawerTarget.classList.remove("-translate-x-full");
    this.overlayTarget.classList.remove("hidden");
    this.overlayTarget.classList.add("opacity-100");
  }

  close() {
    this.drawerTarget.classList.add("-translate-x-full");
    this.overlayTarget.classList.add("hidden");
    this.overlayTarget.classList.remove("opacity-100");
  }
}
