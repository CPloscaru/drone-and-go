// app/javascript/controllers/scroll_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Vérifier si des paramètres 'sort_by' sont présents dans l'URL
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has("sort_by")) {
      // Faire défiler la page jusqu'aux boutons de tri
      this.element.scrollIntoView({ behavior: "smooth", block: "start" });
    }
    setTimeout(() => {
      this.element.scrollIntoView({ behavior: "smooth", block: "start" });
    }, 50); // Délai de 200ms
  }

}
