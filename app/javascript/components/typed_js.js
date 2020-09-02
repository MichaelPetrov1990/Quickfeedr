import Typed from 'typed.js';

const text = document.getElementById("typed");
const newText = () => {
  if (text) {
    new Typed("#typed", {
      strings: ['Web Developer', 'Designer', 'Software Engineer'],
      typeSpeed: 70,
      loop: true
    });
  }
}
export { newText };
