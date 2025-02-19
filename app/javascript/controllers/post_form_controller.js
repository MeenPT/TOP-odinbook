import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="post-form"
export default class extends Controller {
  static targets = ["titleInput", "titleCounter"];

  updateTitleCounter() {
    const max = 280;
    const char_count = this.titleInputTarget.value.length;

    if (char_count > max) {
      this.titleCounterTarget.classList.add("text-red-500");
    } else {
      this.titleCounterTarget.classList.remove("text-red-500");
    }

    this.titleCounterTarget.textContent = `${char_count} / ${max}`;
  }
}
