import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log("hi from the controller");
      var typed3 = new Typed(this.element, {
        strings: [
          '<strong>coach.</strong>',
          '<strong>guru 😇</strong>',
          '<strong>goddess?</strong>',
          '<strong>unicorn 🦄</strong>',
          '<strong>hacker! </strong>',
          '<strong>saviour 🛟</strong>',
          '<strong>yoda!</strong>',
          '<strong>fairy 🧚🏻‍♀️</strong>',
          '<strong>grandma?!?</strong>',
          '<strong>dragon 🐲</strong>'
        ],
        typeSpeed: 50,
        backSpeed: 0,
        smartBackspace: true, // this is a default
        loop: true
    })
  }
}
