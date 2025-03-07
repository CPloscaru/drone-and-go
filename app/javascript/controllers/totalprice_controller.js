import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="totalprice"
export default class extends Controller {
  static targets = ["startingdate", "endingdate", "total", "priceday"]

  connect() {
  }

  startingdate() {
    const startingdate = new Date(this.startingdateTarget.value)
    const endingdate = new Date(this.endingdateTarget.value)

    let nbDays = endingdate.getTime() - startingdate.getTime()
    nbDays = Math.round (nbDays / (1000 * 3600 * 24))

    if (nbDays > 0) {
      const priceday = parseFloat(this.pricedayTarget.innerText)
      this.totalTarget.innerText = nbDays * priceday
     } else {
      this.totalTarget.innerText = "-"
    }
  }

  endingdate() {
    const startingdate = new Date(this.startingdateTarget.value)
    const endingdate = new Date(this.endingdateTarget.value)

    let nbDays = endingdate.getTime() - startingdate.getTime()
    nbDays = Math.round (nbDays / (1000 * 3600 * 24))

    if (nbDays > 0) {
      const priceday = parseFloat(this.pricedayTarget.innerText)
      this.totalTarget.innerText = nbDays * priceday
     } else {
      this.totalTarget.innerText = "-"
    }
  }
}
