const footerTemplate = document.createElement('template');
footerTemplate.innerHTML = `

<style>
footer {
    background-color: #fff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    bottom: 0;
    left: 0;
    right: 0;
    height: 50px;
  }

  a {
    font-family: Roboto;
    text-decoration: none;
  }
  
  .left-buttons a {
    color: #000;
    margin-right: 10px;
    font-size: 15px;
  }

  .legal-notice {
    font-family: "robolto";
    text-decoration: none;
    color: #000;
  }
  
  .right-buttons button {
    background-color: #fff;
    color: #000;
    border: none;
    padding: 5px 10px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
  }
</style>

<footer>
  <div class="left-buttons">
  <a href="https://twitter.com/stoobitofficial " target="_blank">Twitter</a>
  <a href="https://youtube.com/@stoobit" target="_blank">YouTube</a>
  </div>
  <div class="right-buttons">
    <a href="https://www.stoobit.com/legal-notice.html" class="legal-notice">Legal Notice</a>
  </div>
</footer>

`

class Footer extends HTMLElement {
    constructor() {
        // Always call super first in constructor
        super();
    }

    connectedCallback() {
        const shadowRoot = this.attachShadow({ mode: 'open' });
        shadowRoot.appendChild(footerTemplate.content);
    }
}

customElements.define('footer-component', Footer);
