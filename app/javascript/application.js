// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("DOMContentLoaded", function () {
  // Fonction pour basculer le texte du bouton
  function toggleButtonText(buttonId, defaultText, alternateText) {
    const button = document.getElementById(buttonId);
    if (button) {
      button.addEventListener("click", function () {
        if (button.textContent === defaultText) {
          button.textContent = alternateText;
          button.classList.add('active')
        } else {
          button.textContent = defaultText;
          button.classList.remove('active')
        }
      });
    }

  }

  // Appliquer la fonction à chaque bouton
 //toggleButtonText("flight_time_button", "Flight Time ⬆", "Flight Time ⬇");
 // toggleButtonText("max_altitude_button", "Max Altitude ⬆", "Max Altitude ⬇");
 // toggleButtonText("max_wind_resistance_button", "Max Wind Resistance ⬆", "Max Wind Resistance ⬇");
 // toggleButtonText("price_per_day_button", "Price per Day ⬇", "Price per Day ⬆");
});
