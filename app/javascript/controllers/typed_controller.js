import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    console.log("Hi")
    var typed = new Typed(this.element, {
      strings: ['Where Shapeships Become Yours'],
      typeSpeed: 90,
      loop: false
    });
  }
}
