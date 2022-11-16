import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log("hi from the controller");
      var typed3 = new Typed(this.element, {
        strings: [
          'We find your coding <strong>coach.</strong>',
          'We find your coding <strong>guru 😇</strong>',
          'We find your coding <strong>hacker! </strong>',
          'We find your coding <strong>unicorn 🦄</strong>',
          'We find your coding <strong>goddess?</strong>',
          'We find your coding <strong>saviour 🛟</strong>',
          'We find your coding <strong>Yoda!</strong>',
          'We find your coding <strong>fairy 🧚🏻‍♀️</strong>',
          'We find your coding <strong>grandma?!?</strong>',
          'We find your coding <strong>dragon 🐲</strong>'
        ],
        typeSpeed: 50,
        backSpeed: 30,
        smartBackspace: true, // this is a default
        loop: true
    })
  }
}
