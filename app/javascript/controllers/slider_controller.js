import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["price", "sliderValue"]
  connect() {
  }

  fire () {
    // console.log(this.priceTarget.innerText)
    // console.log(this.sliderValueTarget.value)
    this.priceTarget.innerText = this.sliderValueTarget.value + " €"
    const price=this.priceTarget.innerText

    // fetch(`/drones?max_price=${price}`)
    //   .then(response => response.text())
    //   .then((data) => {
    //   })
  }
}
