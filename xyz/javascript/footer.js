const footerTemplate = document.createElement('template');
footerTemplate.innerHTML = `

<style>
  footer {
    background-color: #f2f2f6;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    bottom: 0;
    left: 0;
    right: 0;
    height: 170px;
    vertical-align: top;
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

  h3 {
    font-family: "robolto";
    text-decoration: none;
    color: #000;
  }
</style>

<footer>
  <div class="left-buttons">
    <h3>Socials</h3>
    <p>
      <a href="https://www.instagram.com/productivitypro_app/" target="_blank">Instagram</a>
    </p>
    <p>
      <a href="https://twitter.com/stoobitofficial" target="_blank">X</a>
    </p>
    <p>
      <a href="https://www.youtube.com/@prod_pro" target="_blank">YouTube</a>
    </p>
    <p>
      <a href="https://whatsapp.com/channel/0029VaD7XGC65yDFO8gTBt3N" target="_blank">WhatsApp</a>
    </p>
  </div>

  <div class="left-buttons">
    <h3>Products</h3>
    <p>
      <a href="https://apps.apple.com/app/productivity-pro/id6449678571"
        target="_blank">Productivity Pro</a>
    </p>
    <p>
      <a href="https://apps.apple.com/app/vitality-pro/id6478023736" target="_blank">Vitality Pro</a>
    </p>
    <p>
      <a href="https://apps.apple.com/app/pi-by-stoobit/id1645129218" target="_blank">Pi</a>
    </p>
    <p>
      <a href="" target="_blank"></a>
    </p>
  </div>

  <div class="left-buttons">
    <h3>Contact</h3>
    <p>
      <a href="mailto:support@stoobit.com" target="_blank">Email</a>
    </p>
    <p>
      <a href="imessage://support@stoobit.com" target="_blank">iMessage</a>
    </p>
    <p>
      <a href="https://www.stoobit.com/xyz/legalnotice.html">Legal Notice</a>
    </p>
    <p>
      <a href="" target="_blank"></a>
    </p>
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